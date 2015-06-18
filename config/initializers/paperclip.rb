Paperclip::Attachment.default_options[:url] = ':s3_domain_url'
Paperclip::Attachment.default_options[:path] = '/:class/:attachment/:id_partition/:style/:filename'

# host name may need to be set
Paperclip::Attachment.default_options[:s3_host_name] = 's3-us-west-2.amazonaws.com'
