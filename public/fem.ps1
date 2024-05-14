function New-CommandName {
<#
.SYNOPSIS
Download the entire contents of the blob. The relative link to this endpoint is returned in the GET /entities/external-assets/v1 request.
.DESCRIPTION
Requires 'Falcon Discover: Read'.
.PARAMETER Assetid
The Asset ID
.PARAMETER Hash
The File Hash
.LINK
https://github.com/crowdstrike/psfalcon/wiki/New-CommandName
#>
  [CmdletBinding(DefaultParameterSetName='/fem/entities/blobs-download/v1:get',SupportsShouldProcess)]
  param(
    [Parameter(ParameterSetName='/fem/entities/blobs-download/v1:get',Mandatory,Position=0)]
    [string]$Assetid,
    [Parameter(ParameterSetName='/fem/entities/blobs-download/v1:get',Mandatory,Position=0)]
    [string]$Hash
  )
  begin { $Param = @{ Command = $MyInvocation.MyCommand.Name; Endpoint = $PSCmdlet.ParameterSetName }}
  process { Invoke-Falcon @Param -UserInput $PSBoundParameters }
}
function New-CommandName {
<#
.SYNOPSIS
Download a preview of the blob. The relative link to this endpoint is returned in the GET /entities/external-assets/v1 request.
.DESCRIPTION
Requires 'Falcon Discover: Read'.
.PARAMETER Assetid
The Asset ID
.PARAMETER Hash
The File Hash
.LINK
https://github.com/crowdstrike/psfalcon/wiki/New-CommandName
#>
  [CmdletBinding(DefaultParameterSetName='/fem/entities/blobs-preview/v1:get',SupportsShouldProcess)]
  param(
    [Parameter(ParameterSetName='/fem/entities/blobs-preview/v1:get',Mandatory,Position=0)]
    [string]$Assetid,
    [Parameter(ParameterSetName='/fem/entities/blobs-preview/v1:get',Mandatory,Position=0)]
    [string]$Hash
  )
  begin { $Param = @{ Command = $MyInvocation.MyCommand.Name; Endpoint = $PSCmdlet.ParameterSetName }}
  process { Invoke-Falcon @Param -UserInput $PSBoundParameters }
}
function New-CommandName {
<#
.SYNOPSIS
Update the details of external assets.
.DESCRIPTION
Requires 'Falcon Discover: Write'.
.PARAMETER Cid
The asset's customer ID.
.PARAMETER Criticality
The criticality level manually assigned to this asset.
.PARAMETER CriticalityDescription
The criticality description manually assigned to this asset.
.PARAMETER Id
XXX identifier

The unique ID of the asset.
.PARAMETER Triage
The patch object definition to be applied to the asset
.LINK
https://github.com/crowdstrike/psfalcon/wiki/New-CommandName
#>
  [CmdletBinding(DefaultParameterSetName='/fem/entities/external-assets/v1:patch',SupportsShouldProcess)]
  param(
    [Parameter(ParameterSetName='/fem/entities/external-assets/v1:patch',Position=0)]
    [string]$Cid,
    [Parameter(ParameterSetName='/fem/entities/external-assets/v1:patch',Position=0)]
    [string]$Criticality,
    [Parameter(ParameterSetName='/fem/entities/external-assets/v1:patch',Position=0)]
    [Alias('criticality_description')]
    [string]$CriticalityDescription,
    [Parameter(ParameterSetName='/fem/entities/external-assets/v1:patch',Mandatory,ValueFromPipelineByPropertyName,ValueFromPipeline)]
    [string]$Id,
    [Parameter(ParameterSetName='/fem/entities/external-assets/v1:patch',Position=0)]
    [object]$Triage
  )
  begin { $Param = @{ Command = $MyInvocation.MyCommand.Name; Endpoint = $PSCmdlet.ParameterSetName }}
  process { Invoke-Falcon @Param -UserInput $PSBoundParameters }
}