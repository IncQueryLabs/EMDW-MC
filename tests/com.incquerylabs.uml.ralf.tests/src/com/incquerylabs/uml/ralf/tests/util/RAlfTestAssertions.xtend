package com.incquerylabs.uml.ralf.tests.util


import static org.junit.Assert.*
import org.eclipse.xtext.validation.Issue

class RAlfTestAssertions {
   
    static def void assertAll(Iterable<Issue> issues, String... issueCodes) {
        val unConsumedCodes = newArrayList(issueCodes)
        val unConsumedIssues = newArrayList()
        unConsumedIssues.addAll(issues)
            
        for (Issue i : issues) {
            var String foundCode
            var found = false
            for (String e : unConsumedCodes){
                if(i.code == null){
                    if (e.equals("null")) {
                        foundCode = e;
                        found = true;
                    }
                }else{
                    if (e.equals(i.code)) {
                        foundCode = e;
                        found = true;
                    }
                }
            }
                    
            if (found) {
                unConsumedCodes.remove(foundCode)
                unConsumedIssues.remove(i)
            }
        }
    
        if (unConsumedCodes.size() + unConsumedIssues.size != 0){
           fail('''
                «IF !unConsumedCodes.isEmpty»
                There are diagnostics missing for these predicates: «unConsumedCodes»
                «ENDIF»
                «IF !unConsumedIssues.isEmpty»
                    The following issues were produced unexpectedly: «FOR issue : unConsumedIssues SEPARATOR '\n '»
                    «IF issue.code == null»«"null"»«ELSE»«issue.code»«ENDIF» : «issue.message» (line «issue.lineNumber»)«ENDFOR»
                «ENDIF»
           ''');
        }
    } 
}