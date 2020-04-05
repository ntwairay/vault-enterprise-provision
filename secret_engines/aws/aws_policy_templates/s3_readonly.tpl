{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": ["s3:ListBucket", "s3:ListAllMyBuckets" ],
      "Resource": "arn:aws:s3:::*"
    },
    {
      "Effect": "Allow",
      "Action": ["s3:ListBucket","s3:GetObject"],
      "Resource": ["arn:aws:s3:::${s3bucket}", "arn:aws:s3:::${s3bucket}/*"]
    }
  ]
}
