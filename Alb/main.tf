# create application load balancer
resource "aws_lb" "application_load_balancer" {
  name               =  var.alb
  internal           =  false
  load_balancer_type =  "application"
  ip_address_type =    "ipv4"
  security_groups    = [var.Alb_security_group]
  # subnets            = [var.public_subnet_ID,var.public_subnet_ID-1]
  subnets              = var.ALB_public_subnet
  enable_deletion_protection = false

  tags   = {
    Name = "My-ALB"
  }
}




# create target group
resource "aws_lb_target_group" "Frontend_target_group" {
  name        = "My-Frontend"
  port        =  80
  protocol    =  "HTTP"
  vpc_id      = var.vpc

    health_check {
    path = "/"
  }
}


resource "aws_lb_listener" "Frontend" {
  load_balancer_arn = aws_lb.application_load_balancer.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.Frontend_target_group.arn
  }
}

resource "aws_lb_listener_rule" "frontend_rule" {
  listener_arn = aws_lb_listener.Frontend.arn
  priority     = 1

  condition {
    path_pattern {
      values = ["/"]
    }
  }

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.Frontend_target_group.arn
  }
}

resource "aws_lb_target_group_attachment" "Frontend_attach" {
    target_group_arn = aws_lb_target_group.Frontend_target_group.arn
    target_id = var.target_id_1
  
}








# create target group
resource "aws_lb_target_group" "Attendance_target_group" {
  name        = "My-Attendance"
  target_type =  "instance"
  port        =  80
  protocol    =  "HTTP"
  vpc_id      = var.vpc
 health_check {
    path = "/attendance/search"
  }
}


resource "aws_lb_listener_rule" "attendance" {
  listener_arn = aws_lb_listener.Frontend.arn
  priority     = 3

  condition {
    path_pattern {
      values = ["/attendance*"]
    }
  }

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.Attendance_target_group.arn
  }
}


resource "aws_lb_target_group_attachment" "Attendance_attach" {
    target_group_arn = aws_lb_target_group.Attendance_target_group.arn
    target_id = var.target_id_2
  
}


# create target group
resource "aws_lb_target_group" "salary_target_group" {
  name        = "My-Salary"
  target_type =  "instance"
  port        =  80
  protocol    =  "HTTP"
  vpc_id      = var.vpc

   health_check {
    path = "/salary/search/all"
  }
}


resource "aws_lb_listener_rule" "salary_rule" {
  listener_arn = aws_lb_listener.Frontend.arn
  priority     = 4

  condition {
    path_pattern {
      values = ["/salary*"]
    }
  }

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.salary_target_group.arn
  }
}


resource "aws_lb_target_group_attachment" "Salary_attach" {
    target_group_arn = aws_lb_target_group.salary_target_group.arn
    target_id = var.target_id_3
  
}








# create target group
resource "aws_lb_target_group" "Employee_target_group" {
  name        = "My-Employee"
  target_type =  "instance"
  port        =  80
  protocol    =  "HTTP"
  vpc_id      = var.vpc

   health_check {
    path = "/employee/search/all"
  }
}


resource "aws_lb_listener_rule" "employee_rule" {
  listener_arn = aws_lb_listener.Frontend.arn
  priority     = 2

  condition {
    path_pattern {
      values = ["/employee*"]
    }
  }

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.Employee_target_group.arn
  }
}

resource "aws_lb_target_group_attachment" "Employee_attach" {
    target_group_arn = aws_lb_target_group.Employee_target_group.arn
    target_id = var.target_id_4
  
}