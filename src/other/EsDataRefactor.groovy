package other

def rawMessage = ctx._source.message
def matchPattern = ~/^(\d+)\sms\sexecution\(([[A-Za-z_$]+[A-Za-z_$\\d]+]*\.[[A-Za-z_$]+[A-Za-z_$\\d]+]*)\(.*\)\)$/
def matcher = rawMessage =~ matchPattern
if (matcher.matches()) {
	ctx._source.invokedTime = matcher[0][1]
	ctx._source.invokerMethod = matcher[0][2]
}