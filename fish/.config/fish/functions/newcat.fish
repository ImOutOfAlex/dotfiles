# Defined in - @ line 1
function newcat --description 'alias newcat=feh --bg-center (wget -qO- http://aws.random.cat/meow | jq -r .file)'
	feh --bg-center (wget -qO- http://aws.random.cat/meow | jq -r .file) $argv;
end
