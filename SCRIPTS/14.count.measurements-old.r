length(all.measure$node[which(all.measure$is.in == "B" |
                                all.measure$is.in == "180109")])

#main diameter
length(all.measure$node[which((all.measure$is.in == "B" |
                                 all.measure$is.in == date) & (
                                   is.na(all.measure$maindiameter.real) == FALSE & 
                                     all.measure$maindiameterbroken.real != "b" & 
                                     all.measure$maindiameterbroken.real != "bm") 
)])

#branch diameter
length(all.measure$node[which((all.measure$is.in == "B" |
                                 all.measure$is.in == date) & (
                                   is.na(all.measure$branchdiameter.real) == FALSE & 
                                     all.measure$branchdiameterbroken.real != "b" & 
                                     all.measure$branchdiameterbroken.real != "bm") 
)])

#main length to node
length(all.measure$node[which((all.measure$is.in == "B" |
                                 all.measure$is.in == date) & (
                                   is.na(all.measure$mainlength.real) == FALSE & 
                                     all.measure$main.nodeto != "end" &
                                     is.na(all.measure$main.nodeto) == FALSE &
                                     all.measure$mainlengthbroken.real != "b" & 
                                     all.measure$mainlengthbroken.real != "bm") 
)])

#branch length to node
length(all.measure$node[which((all.measure$is.in == "B" |
                                 all.measure$is.in == date) & (
                                   is.na(all.measure$branchlength.real) == FALSE & 
                                     all.measure$branch.nodeto != "end" &
                                     is.na(all.measure$branch.nodeto) == FALSE &
                                     all.measure$branchlengthbroken.real != "b" & 
                                     all.measure$branchlengthbroken.real != "bm") 
)])


#main length to end
length(all.measure$node[which((all.measure$is.in == "B" |
                                 all.measure$is.in == date) & (
                                   is.na(all.measure$mainlength.real) == FALSE & 
                                     all.measure$main.nodeto == "end" &
                                     all.measure$mainlengthbroken.real != "b" & 
                                     all.measure$mainlengthbroken.real != "bm") 
)])

#branch length to end
length(all.measure$node[which((all.measure$is.in == "B" |
                                 all.measure$is.in == date) & (
                                   is.na(all.measure$branchlength.real) == FALSE & 
                                     all.measure$branch.nodeto == "end" &
                                     all.measure$branchlengthbroken.real != "b" & 
                                     all.measure$branchlengthbroken.real != "bm") 
)])
