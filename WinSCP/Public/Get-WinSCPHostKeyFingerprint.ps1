function Get-WinSCPHostKeyFingerprint {

    [CmdletBinding(
        HelpUri = "https://github.com/dotps1/WinSCP/wiki/Get-WinSCPHostKeyFingerprint"
    )]
    [OutputType(
        [String]
    )]

    param (
        [Parameter(
            Mandatory = $true,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true
        )]
        [WinSCP.SessionOptions[]]
        $SessionOption,

        [Parameter()]
        [ValidateSet(
            "SHA-256", "MD5"
        )]
        [String]
        $Algorithm = "SHA-256"
    )

    begin {
        $session = New-Object -TypeName WinSCP.Session -Property @{
            ExecutablePath = "$PSScriptRoot\..\bin\winscp.exe"
        }
    }

    process {
        foreach ($sessionOptionValue in $SessionOption) {
            try {
                $output = $session.ScanFingerprint(
                    $sessionOptionValue, $Algorithm
                )

                Write-Output -InputObject $output
            } catch {
                $PSCmdlet.WriteError(
                    $_
                )
            }
        }
    }

    end {
        $session.Dispose()
    }
}
