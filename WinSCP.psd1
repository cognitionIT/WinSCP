#
# Module manifest for module 'WinSCP'
#
# Generated by: Thomas J. Malkewitz @dotps1
#
# Generated on: 9/4/2014
#

@{
    # Script module or binary module file associated with this manifest.
    RootModule = 'WinSCP'

    # Version number of this module.
    ModuleVersion = '5.7.2.1'

    # ID used to uniquely identify this module
    GUID = '06e0af4e-779b-48f4-939f-c90b8ec950e6'

    # Author of this module
    Author = 'Thomas J. Malkewitz @dotps1'

    # Company or vendor of this module
    # CompanyName = 'Unknown'

    # Copyright statement for this module
    Copyright = '(c) 2014 Thomas J. Malkewitz. All rights reserved.  Licensed with GNU GENERAL PUBLIC LICENSE'

    # Description of the functionality provided by this module
    Description = 'PowerShell Wrapper Module for WinSCP.'

    # Minimum version of the Windows PowerShell engine required by this module
    PowerShellVersion = '4.0'

    # Name of the Windows PowerShell host required by this module
    # PowerShellHostName = ''

    # Minimum version of the Windows PowerShell host required by this module
    # PowerShellHostVersion = ''

    # Minimum version of Microsoft .NET Framework required by this module
    DotNetFrameworkVersion = '4.5'

    # Minimum version of the common language runtime (CLR) required by this module
    # CLRVersion = ''

    # Processor architecture (None, X86, Amd64) required by this module
    # ProcessorArchitecture = ''

    # Modules that must be imported into the global environment prior to importing this module
    # RequiredModules = @()

    # Assemblies that must be loaded prior to importing this module
    RequiredAssemblies = 'NeededAssemblies\WinSCPnet.dll'

    # Script files (.ps1) that are run in the caller's environment prior to importing this module.
    # ScriptsToProcess = @()

    # Type files (.ps1xml) to be loaded when importing this module
    # TypesToProcess = @()

    # Format files (.ps1xml) to be loaded when importing this module
    # FormatsToProcess = @()

    # Modules to import as nested modules of the module specified in RootModule/ModuleToProcess
    # NestedModules = @()

    # Functions to export from this module
    FunctionsToExport = '*'

    # Cmdlets to export from this module
    CmdletsToExport = '*'

    # Variables to export from this module
    # VariablesToExport = '*'

    # Aliases to export from this module
    # AliasesToExport = '*'

    # List of all modules packaged with this module
    # ModuleList = @()

    # List of all files packaged with this module
    FileList = @('LICENSE.md',
                 'README.md',
                 'WinSCP.psd1',
                 'WinSCP.psm1',
                 'Functions\Close-WinSCPSession.ps1',
                 'Functions\ConvertTo-WinSCPEscapedString.ps1',
                 'Functions\Get-WinSCPDirectoryContents.ps1',
                 'Functions\Get-WinSCPItemInformation.ps1',
                 'Functions\Invoke-WinSCPCommand.ps1',
                 'Functions\Move-WinSCPItem.ps1',
                 'Functions\New-WinSCPDirectory.ps1',
                 'Functions\New-WinSCPFilePermissions.ps1',
                 'Functions\New-WinSCPSessionOptions.ps1',
                 'Functions\New-WinSCPTransferOptions.ps1',
                 'Functions\Open-WinSCPSession.ps1',
                 'Functions\Receive-WinSCPItem.ps1',
                 'Functions\Remove-WinSCPItem.ps1',
                 'Functions\Send-WinSCPItem.ps1',
                 'Functions\Start-WinSCPConsole.ps1',
                 'Functions\Sync-WinSCPDirectory.ps1',
                 'Functions\Test-WinSCPItemExists.ps1',
                 'en-US\about_WinSCP.help.txt',
                 'NeededAssemblies\license.txt',
                 'NeededAssemblies\license-dotnet.txt',
                 'NeededAssemblies\readme.txt',
                 'NeededAssemblies\readme_automation.txt',
                 'NeededAssemblies\WinSCP.exe',
                 'NeededAssemblies\WinSCPnet.dll')

    # Private data to pass to the module specified in RootModule/ModuleToProcess
    # PrivateData = ''

    # HelpInfo URI of this module
    # HelpInfoURI = ''

    # Default prefix for commands exported from this module. Override the default prefix using Import-Module -Prefix.
    # DefaultCommandPrefix = 'WinSCP'
}