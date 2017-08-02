#Lord Hagen / olehag04@nfk.no

#if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) { Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs; exit }


Write-Host ""
Write-Host "Oppgi Passord"
Write-Host ""

$creds = Get-Credential $env:USERDOMAIN\$env:USERNAME-admin
Clear-Host

do {
        do { 
            Write-Host "`n`tRemote Server Administration Tools v1.9`n" -ForegroundColor Magenta
            Write-Host "`t`tHovedmeny`n" -ForegroundColor Cyan
            Write-Host "`t`t`t1. Users & Computers" -ForegroundColor Green
            Write-Host "`t`t`t2. Group Policy Object" -ForegroundColor Green
            Write-Host "`t`t`t3. Print Management" -ForegroundColor Green
            Write-Host "`t`t`t4. Feil Passord" -ForegroundColor Green
            Write-Host ""
            Write-Host "`t`tX - Avslutt`n" -ForegroundColor Red
            Write-Host ""
            Write-Host -nonewline "`tVelg software: " -ForegroundColor Yellow
            
            $choice = read-host
            
            Write-Host ""
            #   Legg til nr. (E.g. [1-99x]) for testing.
            $ok = $choice -match '^[1-4x]+$'
            
            if ( -not $ok) 
                {
                    Clear-Host
                    Write-Host "Ugyldig valg" -ForegroundColor Red
                }

            } until ( $ok )
        
        
        
        switch -Regex ( $choice ) 
            {
        
                "1" #Users & Computers.
                {
                    Start-Process powershell -workingdirectory $PSHOME -Credential $creds -ArgumentList "/c dsa.msc"
                    Start-Sleep -s 2
                    Clear-Host
                }
            
                "2" #Group Policy Object
                {
                    Start-Process powershell -workingdirectory $PSHOME -Credential $creds -ArgumentList "/c gpmc.msc"
                    Start-Sleep -s 2
                    Clear-Host
                }

                "3" #Print Management
                {
                    Start-Process powershell -workingdirectory $PSHOME -Credential $creds -ArgumentList "/c printmanagement.msc"
                    Start-Sleep -s 2
                    Clear-Host
                }

                "4" #Feil Passord
                {
                    $creds = Get-Credential $env:USERDOMAIN\$env:USERNAME-admin
                    Clear-Host
                }
            
                "5" #Test her.
                {
                    #Start-Process powershell -workingdirectory $PSHOME -Credential $creds -ArgumentList "/c xxx.msc"
                }
            
            }


} until ( $choice -match "X" )


#Lord Hagen! // Olehag04@nfk.no