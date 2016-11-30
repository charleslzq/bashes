package other

def rawMessage = ctx._source.message
def matchPattern = ~/\s*([0-9]+)\sms\sexecution.([A-Za-z0-9]+.[A-Za-z0-9]+)[\s\S]*/
def matcher = rawMessage =~ matchPattern
if (matcher.matches()) {
	ctx._source.invokedTime = matcher[0][1]
	ctx._source.invokerMethod = matcher[0][2]
}