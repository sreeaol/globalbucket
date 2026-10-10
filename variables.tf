variable "project_id" {
  description = "Google Cloud project ID"
  type        = string
}
variable "region" {
  description = "Region for the bucket"
  type        = string
  default     = "US"
}
variable "bucket_name" {
  description = "Name of the GCS bucket"
  type        = string
}
variable "storage_class" {
  description = "Storage class (STANDARD, NEARLINE, COLDLINE, ARCHIVE)"
  type        = string
  default     = "STANDARD"
}
variable "force_destroy" {
  description = "Allow bucket deletion even if it contains objects"
  type        = bool
  default     = false
}
