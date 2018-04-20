DOCKER_COMPOSE_ROOT='~/dockerstorage/docker-compose'

# don't forget to leave the trailing spaces at the end so following commands can build on them

# start building our docker-compose command and give it a nice shorterned alias
alias dcrun=' cd ${DOCKER_COMPOSE_ROOT} && \
  source .bash_env && \
  docker-compose \
  -f ./docker-compose.yml \
  -f ./docker-compose.prod.yml '
  # add more override files as desired
  # the last ones have precedence over previous ones, in terms of override order is concerned
  # more info: https://docs.docker.com/compose/extends/#multiple-compose-files

# start your configuration in daemon (background) mode, but first remove any unused containers/volumes/images/networks
alias dcup='dcrun up -d --remove-orphans '

# bring everything down and remove any failed remains along the way
alias dcdown='dcrun down --remove-orphans '

# fetch updated images for all the images specified in your config
alias dcpull='dcrun pull '

# WARNING: this will delete everything that is not being used at the time of running this command
# recommend using this after you have run 'dcup' and everything is running smoothly
# this will wipe out old (and more importantly, unused) containers, images, networks and volumes
# more info (and my findings): https://gist.github.com/bastman/5b57ddb3c11942094f8d0a97d461b430#gistcomment-2222118
# alias dclean='docker system prune -af && docker volume rm $(docker volume ls -f dangling=true -q)'
alias dclean='docker system prune --all --force --volumes'
alias dclean_old='docker system prune --all --force && docker volume rm $(docker volume ls -f dangling=true -q)'
