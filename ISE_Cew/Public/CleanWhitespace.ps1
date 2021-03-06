Function CleanWhitespace {
<#
        .SYNOPSIS
        Used to clean whitespace in Current file for Git Commits
         
        .DESCRIPTION
        Used to clean whitespace in Current file for Git Commits
                
        .EXAMPLE
        $MyMenu.Submenus.Add("Clean up whitespace", { CleanWhitespace }, 'F7')
                        
        .NOTES
        AUTHOR
        Dave Wyatt
        LICENSE
        MIT 
        
      #>
      [cmdletbinding()]
      param ()
    $newText = $psise.CurrentFile.Editor.Text -replace '\t', '    ' -replace '[ ]+([\r\n])', '$1' -replace '^\s*?$' -split '\r?\n' -join "`r`n"
    if ($newText.Length -gt 0 -and $newText[-1] -ne "`n")
    {
        $newText = "$newText`r`n"
    }

    if ($newText -ne $psise.CurrentFile.Editor.Text)
    {
        $psise.CurrentFile.Editor.Text = $newText
    }

}