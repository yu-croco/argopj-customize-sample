.PHONY:helm-upgrade
helm-upgrade:
	helm upgrade -n argocd --create-namespace --install argocd . -f ./values.yaml

.PHONY:show-password
# see https://argoproj.github.io/argo-cd/getting_started/#4-login-using-the-cli
show-password:
	kubectl get pods -n argocd -l app.kubernetes.io/name=argocd-server -o name | cut -d'/' -f 2

.PHONY:show-dashboard
show-dashboard:
	open http://localhost:8080/ &
	kubectl port-forward svc/argocd-server -n argocd 8080:443

.PHONY:update-helm-dependencies
update-helm-dependencies:
	helm dependency update
