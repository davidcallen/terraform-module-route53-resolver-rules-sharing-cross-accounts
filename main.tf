# ---------------------------------------------------------------------------------------------------------------------
# Create Route53 Resolver Rules Share and add Sharing to other accounts
#
#  Note: assumes that "Sharing within the AWS Organisation" is ENABLED.
#        https://docs.aws.amazon.com/ram/latest/userguide/getting-started-sharing.html#getting-started-sharing-orgs
# ---------------------------------------------------------------------------------------------------------------------
resource "aws_ram_resource_share" "route53-resolver-rule" {
  name                      = var.name
  allow_external_principals = false

  tags = merge(var.default_tags, {
    Name = var.name
  })
}

resource "aws_ram_resource_association" "route53-resolver-rule" {
  # resource_arn       = data.aws_ec2_transit_gateway.tgw.arn
  resource_arn       = var.route53_resolver_rule_arn
  resource_share_arn = aws_ram_resource_share.route53-resolver-rule.arn
}

resource "aws_ram_principal_association" "route53-resolver-rule" {
  count              = length(var.share_with_account_ids)
  principal          = var.share_with_account_ids[count.index]
  resource_share_arn = aws_ram_resource_share.route53-resolver-rule.arn
}