# Ansible for GitHub Action

This GitHub action allows you to run [Ansible](https://www.ansible.com/) Playbook.

## Usage

To use the action simply create an `action-name.yml` in the your project `.github/workflows/` directory.

### Basic example:

```yaml
on: push

jobs:
  deploy:
    runs-on: ubuntu-20.04
    steps:
    - name: Check out repository code
      uses: actions/checkout@v2
    - name: Perform ansible playbook to deploy
      uses: actions-ansible@v2
      with:
        playbook: ./path-to-directory/playbook.yml
        inventory: ./path-to-directory/production.yml
```

## License

The associated scripts and documentation in this project are released under the [MIT](license).
