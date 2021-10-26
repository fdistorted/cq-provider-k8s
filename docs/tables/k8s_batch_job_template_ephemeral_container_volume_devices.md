
# Table: k8s_batch_job_template_ephemeral_container_volume_devices
volumeDevice describes a mapping of a raw block device within a container.
## Columns
| Name        | Type           | Description  |
| ------------- | ------------- | -----  |
|job_template_ephemeral_container_cq_id|uuid|Unique CloudQuery ID of k8s_batch_job_template_ephemeral_containers table (FK)|
|name|text|name must match the name of a persistentVolumeClaim in the pod|
|device_path|text|devicePath is the path inside of the container that the device will be mapped to.|