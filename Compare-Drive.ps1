function Get-NameLengthDate {
    [CmdletBinding()]
    param (
        [string] $Path
    )
    return Get-ChildItem -Path $Path -Recurse -File | ForEach-Object { $_.Name + ':' + $_.Length + ':' + $_.LastWriteTime } | Out-String;
}

function Get-NameLengthHash {
    [CmdletBinding()]
    param (
        [string] $Path
    )
    return Get-ChildItem -Path $Path -Recurse -File | ForEach-Object { $_.Name + ':' + $_.Length + ':' + (Get-FileHash -Algorithm 'SHA1' $_).Hash } | Out-String;
}

# ------------------------------ :

$ReferenceDrive = 'D:\';
$DifferenceDrive = 'E:\';

$ReferenceString = Get-NameLengthDate -Path $ReferenceDrive;
$DifferenceString = Get-NameLengthDate -Path $DifferenceDrive;

# ------------------------------ :

$NewLine = [System.Environment]::NewLine;

Compare-Object -ReferenceObject $ReferenceString.Split($NewLine) -DifferenceObject $DifferenceString.Split($NewLine);
