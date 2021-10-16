### ANSIBLE
# mnemonic: [A]nsible [P]laybook
# run ansible playbook with more readable output

echo -n "$@" | grep -q -- "-v" && export ANSIBLE_STDOUT_CALLBACK=yaml
ansible-playbook "$@"
