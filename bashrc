# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Setup 256 color terminal:
if [ -e /usr/share/terminfo/x/xterm-256color ]; then
	export TERM='xterm-256color'
else
	export TERM='xterm-color'
fi



# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
# get current branch in git repo
# get current branch in git repo
function parse_git_branch() {
	BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
	if [ ! "${BRANCH}" == "" ]
	then
		STAT=`parse_git_dirty`
		echo "[${BRANCH}${STAT}]"
	else
		echo ""
	fi
}

# get current status of git repo
function parse_git_dirty {
	status=`git status 2>&1 | tee`
	dirty=`echo -n "${status}" 2> /dev/null | grep "modified:" &> /dev/null; echo "$?"`
	untracked=`echo -n "${status}" 2> /dev/null | grep "Untracked files" &> /dev/null; echo "$?"`
	ahead=`echo -n "${status}" 2> /dev/null | grep "Your branch is ahead of" &> /dev/null; echo "$?"`
	newfile=`echo -n "${status}" 2> /dev/null | grep "new file:" &> /dev/null; echo "$?"`
	renamed=`echo -n "${status}" 2> /dev/null | grep "renamed:" &> /dev/null; echo "$?"`
	deleted=`echo -n "${status}" 2> /dev/null | grep "deleted:" &> /dev/null; echo "$?"`
	bits=''
	if [ "${renamed}" == "0" ]; then
		bits=">${bits}"
	fi
	if [ "${ahead}" == "0" ]; then
		bits="*${bits}"
	fi
	if [ "${newfile}" == "0" ]; then
		bits="+${bits}"
	fi
	if [ "${untracked}" == "0" ]; then
		bits="?${bits}"
	fi
	if [ "${deleted}" == "0" ]; then
		bits="x${bits}"
	fi
	if [ "${dirty}" == "0" ]; then
		bits="!${bits}"
	fi
	if [ ! "${bits}" == "" ]; then
		echo " ${bits}"
	else
		echo ""
	fi
}

export PS1="\[\e[36;40m\]\u\[\e[m\]\[\e[32;40m\]@\[\e[m\]\[\e[32;40m\]\h\[\e[m\]\[\e[40m\]:\[\e[m\]\[\e[37;40m\]\W\[\e[m\]\[\e[37;40m\]:\[\e[m\]\[\e[36;40m\]\`parse_git_branch\`\[\e[m\]\\$ "

export PATH=/NLP_TOOLS/tool_sets/xle/latest/bin:/opt/ruby-gems/bin:/usr/local/bin:/opt/perl/bin:/usr/local/bin:/bin:/usr/bin:/opt/git/bin:/usr/local/sbin:/usr/sbin:/opt/scripts:/condor/bin:/opt/cluto-2.1.1/Linux:/opt/lkb:/NLP_TOOLS/corpus_tools/clan/bin:/opt/TIGERSearch/bin:/opt/xerox-tools:/opt/JMX:/opt/ANT/bin:/opt/javacc-4.0/bin:/opt/lucene-1.9.1/src:/opt/jwnl13rc3/bin:/opt/tnt:/NLP_TOOLS/ml_tools/lm/srilm/latest/bin:/NLP_TOOLS/ml_tools/lm/srilm/latest/bin/i686-m64:/opt/python-modules/bin:/opt/katoob/bin:/NLP_TOOLS/parsers/stanford_parser/latest:/NLP_TOOLS/ml_tools/FST/carmel/latest/bin:/opt/acl82:/NLP_TOOLS/ml_tools/svm/libsvm/latest:/NLP_TOOLS/ml_tools/svm/libsvm/latest/tools:/NLP_TOOLS/parsers/dbparser/latest/bin:/NLP_TOOLS/parsers/minipar/latest/pdemo:/NLP_TOOLS/parsers/mstparser/latest/bin:/NLP_TOOLS/dialogue_tools/brainhat/latest/bin:/NLP_TOOLS/semantics_tools/thoughttreasure/latest/bin:/NLP_TOOLS/speech_tools/festival/latest/speech_tools/bin:/NLP_TOOLS/speech_tools/festival/latest/festival/bin:/NLP_TOOLS/ml_tools/fnTBL/latest/bin:/NLP_TOOLS/ml_tools/FST/fsm/latest/bin:/NLP_TOOLS/parsers/RASP/latest/scripts:/NLP_TOOLS/misc/vilistextum/latest/bin:/NLP_TOOLS/tool_sets/maxent/latest/bin:/NLP_TOOLS/parsers/pet/latest/bin:/NLP_TOOLS/markov_logic/alchemy/latest/bin:/opt/python-2.5/bin:/opt/python-3.4/bin:/opt/python-2.7/bin:/NLP_TOOLS/treebank_tools/tgrep2/latest:/NLP_TOOLS/pos_taggers/medpost/latest:/NLP_TOOLS/speech_tools/praat/latest:/opt/ruby-1.9/bin-links:/opt/jython/bin:/opt/hadoop/bin:/NLP_TOOLS/speech_tools/p2fa/latest:/opt/node/bin:/opt/spark/bin:/NLP_TOOLS/tool_sets/ace/latest:/opt/ruby-gems/lib/ruby/gems/1.8/bin:/opt/xerces/bin:/NLP_TOOLS/WSD/wordnet/latest/bin:/NLP_TOOLS/semantics_tools/ladr/latest/bin:/NLP_TOOLS/tool_sets/giza-pp/latest/GIZA++-v2:/NLP_TOOLS/tool_sets/giza-pp/latest/mkcls-v2:/NLP_TOOLS/ml_tools/lm/irstlm/latest/bin:/NLP_TOOLS/pos_taggers/mecab/latest/bin:/opt/apache-maven/bin:/NLP_TOOLS/markov_logic/htk/latest/bin:/opt/groovy/bin:/NLP_TOOLS/tool_sets/mallet/latest/bin:/opt/fsharp/bin:/home2/bmgraves/.local/bin:/home2/bmgraves/bin:/home2/bmgraves/.vimpkg/bin
