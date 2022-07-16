VERSION 0.6
FROM earthly/dind:alpine
WORKDIR /src

RUN apk add --update --no-cache python3 python3-dev gcc libc-dev && \
    python3 -m ensurepip --upgrade && \
    pip3 install ansible-lint yamllint molecule[docker] docker

COPY ansible.cfg requirements.yml .

ENV ANSIBLE_CONFIG /src/ansible.cfg
ENV ANSIBLE_FORCE_COLOR 1
ENV PY_COLORS 1

RUN ansible-galaxy install -r requirements.yml && \
    ansible-galaxy collection install -v \
        ansible.posix \
        'community.docker:>=1.9.1' \
        community.general

lint:
    COPY .yamllint main.yml .
    COPY roles roles

    RUN yamllint . && ansible-lint

test:
    COPY roles roles
    ARG roles="$(ls roles)"

    FOR role IN $(echo ${roles})
        WITH DOCKER --pull sjoerdthijsse/archlinux:latest
            RUN cd /src/roles/${role} && molecule test
        END
    END
