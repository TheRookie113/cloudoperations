#!/bin/bash
#******************************************************************************
#    AWS VPC Creation Shell Script
#******************************************************************************
#
# SYNOPSIS
#    Automates the creation of a custom IPv4 VPC, having both a public and a
#    private subnet, and a NAT gateway.
#
# DESCRIPTION
#    This shell script leverages the AWS Command Line Interface (AWS CLI) to
#    automatically create a custom VPC.  The script assumes the AWS CLI is
#    installed and configured with the necessary security credentials.
#
#==============================================================================
#
# NOTES
#   VERSION:   0.1.0
#   LASTEDIT:  03/18/2017
#   AUTHOR:    Joe Arauzo
#   EMAIL:     joe@arauzo.net
#   REVISIONS:
#       0.1.0  03/18/2017 - first release
#       0.0.1  02/25/2017 - work in progress
#
#==============================================================================
#   MODIFY THE SETTINGS BELOW
#==============================================================================
#
AWS_REGION="us-west-1"
VPC_NAME="My VPC"
VPC_CIDR="10.0.0.0/16"
SUBNET_PUBLIC_CIDR="10.0.1.0/24"
SUBNET_PUBLIC_AZ="us-west-1a"
SUBNET_PUBLIC_NAME="10.0.1.0 - us-west-1a"
SUBNET_PRIVATE_CIDR="10.0.2.0/24"
SUBNET_PRIVATE_AZ="us-west-1c"
SUBNET_PRIVATE_NAME="10.0.2.0 - us-west-1b"
CHECK_FREQUENCY=5
#
#==============================================================================
#   DO NOT MODIFY CODE BELOW
#==============================================================================
#
# Create VPC
aws --version
echo "Creating VPC in preferred region..."
VPC_ID=$(aws ec2 create-vpc --cidr-block $VPC_CIDR --query 'Vpc.{VpcId:VpcId}' --output text --region $AWS_REGION)
echo "  VPC ID '$VPC_ID' CREATED in '$AWS_REGION' region."