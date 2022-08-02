resource "google_service_account" "kubernetes" {
  account_id = "kubernetes"
}

resource "google_project_iam_member" "storage-admin" {
  project = "mahmoudrizk"
  role    = "roles/storage.admin"
  member  = "serviceAccount:${google_service_account.kubernetes.email}"
}