The file 'First Attempt at SAS.rmd' will set up SAS in a code chunk, run SAS commands in that, and then run R in the next code chunk.

The file 'Second Attempt at SAS.rmd' will set up SAS in the setup code chunk, run SAS commands in next code chunk, and then attempt to run R in the code chunk following.  This will produce an error, because setting up SAS in the setup code chunk cause all chunks to be run using SAS.
