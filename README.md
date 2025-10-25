## 🔄 Deployment Workflow

### Continuous Integration (Automated)
When you push to `main` branch:
1. ✅ GitHub Actions builds Docker image
2. ✅ Pushes to GitHub Container Registry (ghcr.io)
3. ✅ Image is publicly available

### Continuous Deployment (Manual)
After the build completes:
```powershell
# Run the deployment script
.\deploy.ps1

# Or manually:
kubectl set image deployment/wisecow-deployment \
  wisecow=ghcr.io/YOUR_USERNAME/wisecow:latest

kubectl rollout status deployment/wisecow-deployment
```

**Note**: Automatic deployment to local Minikube is not possible from GitHub Actions as it cannot reach localhost. For full automation, deploy to a cloud Kubernetes cluster.
