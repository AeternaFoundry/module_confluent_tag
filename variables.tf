variable "tags" {
  description = <<EOT
Map of tags, attributes below
Required:
    - name
Optional:
    - description
    - rest_endpoint
    - credentials (block):
        - key (required)
        - secret (required)
    - schema_registry_cluster (block):
        - id (required)
EOT

  type = map(object({
    name          = string
    description   = optional(string)
    rest_endpoint = optional(string)
    credentials = optional(object({
      key    = string
      secret = string
    }))
    schema_registry_cluster = optional(object({
      id = string
    }))
  }))
  # Note: 4 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

