# Create RDS Database Instance
resource "aws_db_instance" "database" {
  vpc_security_group_ids = [aws_security_group.db.id]
}

# Define Security Group
resource "aws_security_group" "db" {
  vpc_id = aws_vpc.testvpc.id

}