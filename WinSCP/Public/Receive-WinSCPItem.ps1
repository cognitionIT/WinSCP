﻿function Receive-WinSCPItem {

    [CmdletBinding(
        HelpUri = "https://github.com/dotps1/WinSCP/wiki/Receive-WinSCPItem"
    )]
    [OutputType(
        [WinSCP.TransferOperationResult]
    )]

    param (
            [Parameter(
            Mandatory = $true,
            ValueFromPipeline = $true
        )]
        [ValidateScript({
            if ($_.Opened) {
                return $true
            } else {
                throw "The WinSCP Session is not in an Open state."
            }
        })]
        [WinSCP.Session]
        $WinSCPSession,

        [Parameter(
            Mandatory = $true,
            ValueFromPipelineByPropertyName = $true
        )]
        [Alias(
            "Path"
        )]
        [String[]]
        $RemotePath,

        [Parameter()]
        [Alias(
            "Destination"
        )]
        [String]
        $LocalPath = $pwd,

        [Parameter()]
        [Switch]
        $Remove,

        [Parameter()]
        [WinSCP.TransferOptions]
        $TransferOptions = ( New-Object -TypeName WinSCP.TransferOptions )
    )

    process {
        foreach ($remotePathValue in ( Format-WinSCPPathString -Path $($RemotePath) )) {
            if ((Get-Item -Path $LocalPath).PSIsContainer -and -not $LocalPath.EndsWith( [System.IO.Path]::DirectorySeparatorChar )) {
                $LocalPath += [System.IO.Path]::DirectorySeparatorChar
            }

            try {
                $result = $WinSCPSession.GetFiles(
                    $remotePathValue, $LocalPath, $Remove.IsPresent, $TransferOptions
                )

                if ($result.IsSuccess) {
                    Write-Output -InputObject $result
                } else {
                    $result.Failures[0] |
                        Write-Error
                }
            } catch {
                $PSCmdlet.WriteError(
                    $_
                )
            }
        }
    }
}
