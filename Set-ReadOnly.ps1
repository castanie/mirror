function Set-ReadOnly {
    [CmdletBinding()]
    param (
        [string] $Path
    )
    Get-ChildItem -Path $Path -Recurse -File | Set-ItemProperty -Name 'Attributes' -Value 'ReadOnly';
}

# ------------------------------ :

Set-ReadOnly -Path 'D:\';
Set-ReadOnly -Path 'E:\';
