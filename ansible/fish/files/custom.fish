# Enable fish bindings
fish_vi_key_bindings

# Conda files
# source /Users/siva.kommuri/.local/share/omf/themes/sushi/fish_right_prompt.fish
# source /usr/local/anaconda/etc/fish/conf.d/conda.fish
# conda activate base

set -gx PATH /usr/local/opt/mysql-client/bin $PATH

set -gx GOPATH $HOME/go 

set -gx PATH $GOPATH/bin $PATH
alias go colorgo
alias git hub

set -gx LESS "-XgmR"

# bobthefish
set -g theme_color_scheme  light
set -g theme_display_k8s_context yes
set -g theme_display_virtualenv no

###################################

# https://stackoverflow.com/questions/4421633/who-is-listening-on-a-given-tcp-port-on-mac-os-x
function pport
  lsof -nP -iTCP:$argv | grep LISTEN
end

# alias get-aws-credentials='f(){ cmd="docker run -it --rm -v ~/.aws:/package/.aws quay.io/wework/onelogin-aws-saml sh -c \"python /package/samlapi.py "$@"\""; bash -c "${cmd}" unset -f f; }; f'
function get-aws-credentials
	docker run -it --rm -v ~/.aws:/package/.aws quay.io/wework/onelogin-aws-saml sh -c "python /package/samlapi.py $argv" 
end


# kube - config management
# kubectx - context management
# kubens - namespace management
function kube
	if count $argv > /dev/null
		# switch to the specified config
		set -gx KUBECONFIG ~/.kube/$argv
	else
		# list kube configs
		grep -le '^contexts:' ~/.kube/* 2> /dev/null | cut -d '/' -f 5
	end
end

