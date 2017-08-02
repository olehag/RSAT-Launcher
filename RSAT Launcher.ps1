#Lord Hagen / olehag04@nfk.no
#Rev1.9

#next line might be needed.
#if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) { Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs; exit }


Write-Host ""
Write-Host "Input Credentials"
Write-Host ""

$creds = Get-Credential $env:USERDOMAIN\$env:USERNAME-admin
Clear-Host

do {
        do { 
            Write-Host "`n`tRSAT Launcher`n" -ForegroundColor Magenta
            Write-Host "`t`tMain Meny`n" -ForegroundColor Cyan
            Write-Host "`t`t`t1. Users & Computers" -ForegroundColor Green
            Write-Host "`t`t`t2. Group Policy Object" -ForegroundColor Green
            Write-Host "`t`t`t3. Print Management" -ForegroundColor Green
            Write-Host "`t`t`t4. Wrong password" -ForegroundColor Green
            #Write-Host "`t`t`t4. " -ForegroundColor Green
            #Write-Host "`t`t`t5. " -ForegroundColor Green
            #Write-Host "`t`t`t6. " -ForegroundColor Green
            #Write-Host "`t`t`t7. " -ForegroundColor Green
            #Write-Host "`t`t`t8. " -ForegroundColor Green
            #Write-Host "`t`t`t9. " -ForegroundColor Green
            Write-Host ""
            Write-Host "`t`tX - Exit`n" -ForegroundColor Red
            Write-Host ""
            Write-Host -nonewline "`tSoftware: " -ForegroundColor Yellow
            
            $choice = read-host
            
            Write-Host ""
                #    Add (example: [1-6x]) if you have expanded the meny.
            $ok = $choice -match '^[1-4x]+$'
            
            if ( -not $ok) 
                {
                    Clear-Host
                    Write-Host "Invalid choice" -ForegroundColor Red
                }

            } until ( $ok )
        
        
        
        switch -Regex ( $choice ) 
            {
        
                "1" #Users & Computers.
                {
                    Start-Process powershell -workingdirectory $PSHOME -Credential $creds -ArgumentList "/c dsa.msc"
                    Start-Sleep -s 1
                    Clear-Host
                }
            
                "2" #Group Policy Object
                {
                    Start-Process powershell -workingdirectory $PSHOME -Credential $creds -ArgumentList "/c gpmc.msc"
                    Start-Sleep -s 1
                    Clear-Host
                }

                "3" #Print Management
                {
                    Start-Process powershell -workingdirectory $PSHOME -Credential $creds -ArgumentList "/c printmanagement.msc"
                    Start-Sleep -s 1
                    Clear-Host
                }

                "4" #Wrong password
                {
                    $creds = Get-Credential $env:USERDOMAIN\$env:USERNAME-admin
                    Clear-Host
                }
            
                "5" #Expansion
                {
                    #Start-Process powershell -workingdirectory $PSHOME -Credential $creds -ArgumentList "/c xxx.msc"
                }
                
                "6" #Expansion
                {
                    #Start-Process powershell -workingdirectory $PSHOME -Credential $creds -ArgumentList "/c xxx.msc"
                }

                "7" #Expansion
                {
                    #Start-Process powershell -workingdirectory $PSHOME -Credential $creds -ArgumentList "/c xxx.msc"
                }

                "8" #Expansion
                {
                    #Start-Process powershell -workingdirectory $PSHOME -Credential $creds -ArgumentList "/c xxx.msc"
                }

                "9" #Expansion
                {
                    #Start-Process powershell -workingdirectory $PSHOME -Credential $creds -ArgumentList "/c xxx.msc"
                }
         
            }


} until ( $choice -match "X" )


#Lord Hagen! // Olehag04@nfk.no