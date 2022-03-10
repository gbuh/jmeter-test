import os
import boto3

s3_resource = boto3.resource("s3", region_name="eu-central-1")

def upload_objects():
    try:
        bucket_name = "i-test-perf" #s3 bucket name
        root_path = 'upload/html' #local folder for upload

        my_bucket = s3_resource.Bucket(bucket_name)

        for path, subdirs, files in os.walk(root_path):
            directory_name = path.replace(root_path,"html")
            for file in files:
                my_bucket.upload_files(os.path.join(path, file), directory_name+'/'+file)

    except Exception as err:
        print(err)

if __name__ == '__main__':
    upload_objects()