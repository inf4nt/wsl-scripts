grep -qxF 'set completion-ignore-case on' /etc/inputrc || echo set completion-ignore-case on | sudo tee -a /etc/inputrc
