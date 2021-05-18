data "google_iam_policy" "admin" {
  binding {
    role = "roles/secretmanager.admin"
    members = [
      "serviceAccount:codefresh-sa@codefresh-312809.iam.gserviceaccount.com",
    ]
  }
}

resource "google_secret_manager_secret_iam_policy" "policy" {
  project = "codefresh-2"
  secret_id = "test"
  policy_data = data.google_iam_policy.admin.policy_data
}

