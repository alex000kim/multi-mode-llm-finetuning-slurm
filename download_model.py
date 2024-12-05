from huggingface_hub import snapshot_download

# download model to local directory
snapshot_download(repo_id="meta-llama/Meta-Llama-3-8B", local_dir="llama-3-8b")