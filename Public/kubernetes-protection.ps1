function Edit-FalconContainerAwsAccount {
<#
.Synopsis
Modify Falcon Container Security AWS accounts
.Parameter Ids
AWS account identifier(s)
.Parameter Region
AWS cloud region
.Role
kubernetes-protection:write
#>
    [CmdletBinding(DefaultParameterSetName = '')]
    param(
        [Parameter(ParameterSetName = '/kubernetes-protection/entities/accounts/aws/v1:patch', Mandatory = $true,
            Position = 1)]
        [ValidateSet('^\d{12}$')]
        [array] $Ids,

        [Parameter(ParameterSetName = '/kubernetes-protection/entities/accounts/aws/v1:patch', Position = 2)]
        [string] $Region
    )
    begin {
        $Param = @{
            Command  = $MyInvocation.MyCommand.Name
            Endpoint = $PSCmdlet.ParameterSetName
            Inputs   = $PSBoundParameters
            Format   = @{
                Query = @('ids', 'region')
            }
        }
    }
    process {
        Invoke-Falcon @Param
    }
}
function Get-FalconContainerAwsAccount {
<#
.Synopsis
Search for Falcon Container Security AWS accounts
.Parameter Ids
AWS account identifier(s)
.Parameter Status
Filter by account status
.Parameter Limit
Maximum number of results per request
.Parameter Offset
Position to begin retrieving results
.Parameter All
Repeat requests until all available results are retrieved
.Parameter Total
Display total result count instead of results
.Role
kubernetes-protection:read
#>
    [CmdletBinding(DefaultParameterSetName = '/kubernetes-protection/entities/accounts/aws/v1:get')]
    param(
        [Parameter(ParameterSetName = '/kubernetes-protection/entities/accounts/aws/v1:get', Position = 1)]
        [ValidateSet('^\d{12}$')]
        [array] $Ids,

        [Parameter(ParameterSetName = '/kubernetes-protection/entities/accounts/aws/v1:get', Position = 2)]
        [ValidateSet('provisioned', 'operational')]
        [string] $Status,

        [Parameter(ParameterSetName = '/kubernetes-protection/entities/accounts/aws/v1:get', Position = 3)]
        [int] $Limit,

        [Parameter(ParameterSetName = '/kubernetes-protection/entities/accounts/aws/v1:get', Position = 4)]
        [int] $Offset,

        [Parameter(ParameterSetName = '/kubernetes-protection/entities/accounts/aws/v1:get')]
        [switch] $All,

        [Parameter(ParameterSetName = '/kubernetes-protection/entities/accounts/aws/v1:get')]
        [switch] $Total
    )
    begin {
        $Param = @{
            Command  = $MyInvocation.MyCommand.Name
            Endpoint = $PSCmdlet.ParameterSetName
            Inputs   = $PSBoundParameters
            Format   = @{
                Query = @('ids', 'offset', 'limit', 'status')
            }
        }
    }
    process {
        Invoke-Falcon @Param
    }
}
function Get-FalconContainerCloud {
<#
.Synopsis
List cloud provider locations acknowledged by Falcon Container Security
.Parameter Clouds
Cloud provider(s)
.Role
kubernetes-protection:read
#>
    [CmdletBinding(DefaultParameterSetName = '/kubernetes-protection/entities/cloud-locations/v1:get')]
    param(
        [Parameter(ParameterSetName = '/kubernetes-protection/entities/cloud-locations/v1:get', Position = 1)]
        [ValidateSet('aws', 'azure', 'gcp')]
        [array] $Clouds
    )
    begin {
        $Param = @{
            Command  = $MyInvocation.MyCommand.Name
            Endpoint = $PSCmdlet.ParameterSetName
            Inputs   = $PSBoundParameters
            Format   = @{
                Query = @('clouds')
            }
        }
    }
    process {
        Invoke-Falcon @Param
    }
}
function Get-FalconContainerCluster {
<#
.Synopsis
List clusters acknowledged by Falcon Container Security
.Parameter Ids
Cluster account identifier(s)
.Parameter Locations
Cloud provider location(s)
.Parameter ClusterNames
Cluster name(s)
.Parameter ClusterService
Cluster service
.Parameter Limit
Maximum number of results per request
.Parameter Offset
Position to begin retrieving results
.Parameter All
Repeat requests until all available results are retrieved
.Parameter Total
Display total result count instead of results
.Role
kubernetes-protection:read
#>
    [CmdletBinding(DefaultParameterSetName = '/kubernetes-protection/entities/kubernetes/clusters/v1:get')]
    param(
        [Parameter(ParameterSetName = '/kubernetes-protection/entities/kubernetes/clusters/v1:get', Position = 1)]
        [array] $Ids,

        [Parameter(ParameterSetName = '/kubernetes-protection/entities/kubernetes/clusters/v1:get', Position = 2)]
        [array] $Locations,

        [Parameter(ParameterSetName = '/kubernetes-protection/entities/kubernetes/clusters/v1:get', Position = 3)]
        [array] $ClusterNames,

        [Parameter(ParameterSetName = '/kubernetes-protection/entities/kubernetes/clusters/v1:get', Position = 4)]
        [ValidateSet('eks')]
        [string] $ClusterService,

        [Parameter(ParameterSetName = '/kubernetes-protection/entities/kubernetes/clusters/v1:get', Position = 5)]
        [int] $Limit,

        [Parameter(ParameterSetName = '/kubernetes-protection/entities/kubernetes/clusters/v1:get', Position = 6)]
        [int] $Offset,

        [Parameter(ParameterSetName = '/kubernetes-protection/entities/kubernetes/clusters/v1:get')]
        [switch] $All,

        [Parameter(ParameterSetName = '/kubernetes-protection/entities/kubernetes/clusters/v1:get')]
        [switch] $Total
    )
    begin {
        $Fields = @{
            ClusterNames   = 'cluster_names'
            ClusterService = 'cluster_service'
            Ids            = 'account_ids'
        }
        $Param = @{
            Command  = $MyInvocation.MyCommand.Name
            Endpoint = $PSCmdlet.ParameterSetName
            Inputs   = Update-FieldName -Fields $Fields -Inputs $PSBoundParameters
            Format   = @{
                Query = @('limit', 'cluster_names', 'account_ids', 'offset', 'cluster_service', 'locations')
            }
        }
    }
    process {
        Invoke-Falcon @Param
    }
}
function Invoke-FalconContainerScan {
<#
.Synopsis
Initiate a scan of your Kubernetes footprint
.Parameter ScanType
Scan type
.Role
kubernetes-protection:write
#>
    [CmdletBinding(DefaultParameterSetName = '/kubernetes-protection/entities/scan/trigger/v1:post')]
    param(
        [Parameter(ParameterSetName = '/kubernetes-protection/entities/scan/trigger/v1:post', Mandatory = $true,
            Position = 1)]
        [ValidateSet('dry-run', 'full', 'cluster-refresh')]
        [string] $ScanType
    )
    begin {
        $Fields = @{
            ScanType = 'scan_type'
        }
        $Param = @{
            Command  = $MyInvocation.MyCommand.Name
            Endpoint = $PSCmdlet.ParameterSetName
            Inputs   = Update-FieldName -Fields $Fields -Inputs $PSBoundParameters
            Format   = @{
                Query = @('scan_type')
            }
        }
    }
    process {
        Invoke-Falcon @Param
    }
}
function New-FalconContainerAwsAccount {
<#
.Synopsis
Provision Falcon Container Security accounts
.Parameter Id
AWS account identifier
.Parameter Region
AWS cloud region
.Role
kubernetes-protection:write
#>
    [CmdletBinding(DefaultParameterSetName = '/kubernetes-protection/entities/accounts/aws/v1:post')]
    param(
        [Parameter(ParameterSetName = '/kubernetes-protection/entities/accounts/aws/v1:post', Mandatory = $true,
            Position = 1)]
        [ValidateSet('^\d{12}$')]
        [string] $Id,

        [Parameter(ParameterSetName = '/kubernetes-protection/entities/accounts/aws/v1:post', Mandatory = $true,
            Position = 2)]
        [string] $Region
    )
    begin {
        $Fields = @{
            Id = 'account_id'
        }
        $Param = @{
            Command  = $MyInvocation.MyCommand.Name
            Endpoint = $PSCmdlet.ParameterSetName
            Inputs   = Update-FieldName -Fields $Fields -Inputs $PSBoundParameters
            Format   = @{
                Body = @{
                    resources = @('account_id', 'region')
                }
            }
        }
    }
    process {
        Invoke-Falcon @Param
    }
}
function New-FalconContainerKey {
<#
.Synopsis
Regenerate the API key for Docker registry integrations
.Role
kubernetes-protection:write
#>
    [CmdletBinding(DefaultParameterSetName = '/kubernetes-protection/entities/integration/api-key/v1:post')]
    param()
    begin {
        $Param = @{
            Command  = $MyInvocation.MyCommand.Name
            Endpoint = $PSCmdlet.ParameterSetName
            Inputs   = $PSBoundParameters
        }
    }
    process {
        Invoke-Falcon @Param
    }
}
function Receive-FalconContainerYaml {
<#
.Synopsis
Download a sample Helm values.yaml file
.Parameter ClusterName
Cluster name
.Parameter Path
Destination path
.Role
kubernetes-protection:read
#>
    [CmdletBinding(DefaultParameterSetName = '/kubernetes-protection/entities/integration/agent/v1:get')]
    param(
        [Parameter(ParameterSetName = '/kubernetes-protection/entities/integration/agent/v1:get',
            Mandatory = $true, Position = 1)]
        [string] $ClusterName,

        [Parameter(ParameterSetName = '/kubernetes-protection/entities/integration/agent/v1:get',
            Mandatory = $true, Position = 2)]
        [ValidatePattern('^*\.yaml$')]
        [ValidateScript({
            if (Test-Path $_) {
                throw "An item with the specified name $_ already exists."
            } else {
                $true
            }
        })]
        [string] $Path
    )
    begin {
        $Fields = @{
            ClusterName = 'cluster_name'
        }
        $Param = @{
            Command  = $MyInvocation.MyCommand.Name
            Endpoint = $PSCmdlet.ParameterSetName
            Inputs   = Update-FieldName -Fields $Fields -Inputs $PSBoundParameters
            Headers  = @{
                Accept = 'application/yaml'
            }
            Format   = @{
                Query   = @('cluster_name')
                Outfile = 'path'
            }
        }
    }
    process {
        Invoke-Falcon @Param
    }
}
function Remove-FalconContainerAwsAccount {
<#
.Synopsis
Remove Falcon Container Security AWS accounts
.Parameter Ids
AWS account identifier(s)
.Role
kubernetes-protection:write
#>
    [CmdletBinding(DefaultParameterSetName = '/kubernetes-protection/entities/accounts/aws/v1:delete')]
    param(
        [Parameter(ParameterSetName = '/kubernetes-protection/entities/accounts/aws/v1:delete', Mandatory = $true,
            Position = 1)]
        [ValidateSet('^\d{12}$')]
        [array] $Ids
    )
    begin {
        $Param = @{
            Command  = $MyInvocation.MyCommand.Name
            Endpoint = $PSCmdlet.ParameterSetName
            Inputs   = $PSBoundParameters
            Format   = @{
                Query = @('ids')
            }
        }
    }
    process {
        Invoke-Falcon @Param
    }
}