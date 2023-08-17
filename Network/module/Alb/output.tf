output "Attendance_target_group_arn" {
    value = aws_lb_target_group.Attendance_target_group.arn

}




output "Employee_target_group_arn" {
    value = aws_lb_target_group.Employee_target_group.arn

}




output "Salary_target_group_arn" {
    value = aws_lb_target_group.salary_target_group.arn

}

output "application_load_bal_DNS" {
    value = aws_lb.application_load_balancer.dns_name

}    
  

output "application_load_bal_ZONE" {
    value = aws_lb.application_load_balancer.zone_id

}  