﻿Function New-WinSCPItem {
    [CmdletBinding(
        SupportsShouldProcess = $true,
        HelpUri = 'https://github.com/dotps1/WinSCP/wiki/New-WinSCPItem'
    )]
    [OutputType(
        [WinSCP.RemoteFileInfo]
    )]
    
    Param (
        [Parameter(
            Mandatory = $true,
            ValueFromPipeline = $true
        )]
        [ValidateScript({ 
            if ($_.Opened) { 
                return $true 
            } else { 
                throw 'The WinSCP Session is not in an Open state.'
            }
        })]
        [WinSCP.Session]
        $WinSCPSession,

        [Parameter(
            ValueFromPipelineByPropertyName = $true
        )]
        [String[]]
        $Path = '/',

        [Parameter(
            ValueFromPipelineByPropertyName = $true
        )]
        [String]
        $Name = $null,

        [Parameter()]
        [String]
        $ItemType = 'File',

        [Parameter()]
        [String]
        $Value = $null,

        [Parameter()]
        [Switch]
        $Force
    )

    Begin {
        $sessionValueFromPipeLine = $PSBoundParameters.ContainsKey('WinSCPSession')
    }

    Process {
        foreach ($item in (Format-WinSCPPathString -Path $($Path))) {
            if ($PSBoundParameters.ContainsKey('Name')) {
                $item = Format-WinSCPPathString -Path $(Join-Path -Path $item -ChildPath $Name)
            }

            if (-not (Test-WinSCPPath -WinSCPSession $WinSCPSession -Path (Split-Path -Path $item -Parent))) {
                Write-Error -Message "Could not find a part of the path '$item'"

                continue
            }

            if ((Test-WinSCPPath -WinSCPSession $WinSCPSession -Path $item) -and -not $Force.IsPresent) {
                Write-Error -Message "An item with the spcified name '$item' already exists."

                continue
            } 

            try {
                $newItemParams = @{
                    Path = $env:TEMP
                    Name = (Split-Path -Path $item -Leaf)
                    ItemType = $ItemType
                    Value = $Value
                    Force = $true
                }

                if ($PSCmdlet.ShouldProcess($item)) {
                    $WinSCPSession.PutFiles((New-Item @newItemParams).FullName, $item, $true)

                    Get-WinSCPItem -WinSCPSession $WinSCPSession -Path $item
                }
            } catch {
                Write-Error -Message $_.ToString()
            }
        }
    }

    End {
        if (-not ($sessionValueFromPipeLine)) {
            Remove-WinSCPSession -WinSCPSession $WinSCPSession
        }
    }
}