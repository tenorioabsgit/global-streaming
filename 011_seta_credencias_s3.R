Sys.setenv("AWS_ACCESS_KEY_ID" = "",
           "AWS_SECRET_ACCESS_KEY" = "",
           "AWS_DEFAULT_REGION" = "eu-north-1")


# Chama a função para verificar se pasta existe ou criar a pasta no S3
create_s3_folder(bucket = "", folder_name = "iptv", region_name = "eu-north-1")
# Sobe arquivos no S3
aws.s3::put_object(file = "reduced.m3u8", object = "reduced.m3u8", bucket = "", show_progress = TRUE, region = "eu-north-1")
aws.s3::put_object(file = "full.m3u8", object = "full.m3u8", bucket = "", show_progress = TRUE, region = "eu-north-1")
aws.s3::put_object(file = "reduced.xml.gz", object = "reduced.xml.gz", bucket = "", show_progress = TRUE, region = "eu-north-1", multipart = T)