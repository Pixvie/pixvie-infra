provider "google" {
  credentials = file("creds.json")
  project     = "thinking-prism-369019"
  region      = "europe-west3"
}
