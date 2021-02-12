//Output AD final OU
output "ad_ou" {
  value = onefuse_microsoft_ad_computer_account.computer.final_ou
}