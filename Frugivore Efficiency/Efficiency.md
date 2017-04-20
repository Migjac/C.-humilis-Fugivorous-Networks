Frugivore efficiency network analysis
================

#### **Step 1. **Open Martinazo and Matasgordas efficiency matrix

Opening a matrix file with weighted links with frugivores fruit remotion efficiency in individual plants. The data set to construct this matrix was the resul of dividing *fruits/day and visits/day= fruits/visit*

``` r
#Martinazo
mart_e<-read.csv("~/Desktop/Palmito/Postdoc-Interaction Networks/Dispersal-Networks/Efficiency/mart_eff.csv",header=TRUE,check.names=FALSE,row.names=1)

#Matasgordas
matas_e<-read.csv("~/Desktop/Palmito/Postdoc-Interaction Networks/Dispersal-Networks/Efficiency/matas_eff.csv",header=TRUE,check.names=FALSE,row.names=1)
```

 

#### **Step 2.** Using "bipartite" package

 

    library(bipartite)

 

   

##### *Step 2.1.* Ploting the web.

Creates a bipartite network were the high level will be represented by the frugivores and low level to each individual plant. *Links are weigthed with the frugivory efficiency fruit animal/individual plant/visits per day*.[1]

![](Efficiency_files/figure-markdown_github/unnamed-chunk-3-1.png)

   

#### **Step 3.** Calculate indices describing network topography.

##### **Step 4.1.** Network measures

 

-   **Network level** Analysis of bipartite webs at the level of the entire network

-   *Connectance:* Degree of specialization of the netwwork, meaure the proportion of possible links. C = L/(IJ). This is the standardized number of species combinations often used in co-occurrence analyses (Gotelli and Graves 1996); also identical to 2-species motifs sensu Milo et al. (2002).

-   *Cluster coefficient:* Mean, across all species, of the number of realized links divided by the number of possible links for each species (i.e. average per-species connectance).

-   *Web Assymethry:* Balance between numbers in the two levels W = (I– J)/(I+J). Positive numbers indicate more lower-trophic level species, negative more higher-trophic level species; rescaled to \[–1, 1\] (see Blüthgen et al. 2007).

-   *Nestednes and Wegihted Nestedness:* Interaction degree between specialists and the subset of species to which the generalists interact

 

``` r
#Martinazo
networklevel(mart_e, index = c("connectance","web asymmetry","cluster coefficient","nestedness","weighted nestedness"))
```

    ##            connectance          web asymmetry    cluster coefficient 
    ##              0.2878788             -0.5714286              0.1590909 
    ##             nestedness    weighted nestedness cluster.coefficient.HL 
    ##             19.0786237              0.6402406              0.7525009 
    ## cluster.coefficient.LL 
    ##              0.3620076

``` r
#Matasgordas
networklevel(matas_e,index = c("connectance","web asymmetry","cluster coefficient","nestedness","weighted nestedness"))
```

    ##            connectance          web asymmetry    cluster coefficient 
    ##              0.2647059             -0.6585366              0.2647059 
    ##             nestedness    weighted nestedness cluster.coefficient.HL 
    ##             25.6257289              0.4756216              0.4226532 
    ## cluster.coefficient.LL 
    ##              0.3247715

 

-   *Modularity:* Identify modules of closely interecting frugivores. Also test to what extent these modules have a spatial component. High modularity values means that the network is more stable.

Martinazo

    ## [1] 0.1928246

Matasgordas

    ## [1] 0.5641114

Modularity in Matasgordas (0.569946) than Martinazo (0.500577)

   

##### Ploting modules in the networks

![](Efficiency_files/figure-markdown_github/plots%20of%20the%20visit%20modules-1.png)          

Figure 3.

 

&nbsp \* **Link level.** Interaction variance between nodes. The outcome is a matrix with dependence values. Computes the contribution of each species to the overall nestedness.

``` r
link_lev_mart<-linklevel(mart_e)
link_lev_matas<-linklevel(matas_e)
```

   

 

##### **Step 5.**Calculate the topography of the nodes and their relative importance to the network. Information that we can relate to the aggregation level of this plants through GLM or GAM.

There are three different levels this can be achieved at: the entire web (using function networklevel), at the level of each group (also using function networklevel) or the individual species (using function specieslevel).

-   **Relative degree.** It is a centrality measure. Proportion of interactions in relation to the potential partners in the network. Importance with the number of plants or animals with which they interact. High values in individual plants in our system is related to "more attractiveness". (qualitative characteristic of the node) interact or not

-   **Species strength.** (Dorman, 2011). Describe how much the plants depends on the visits by a particular animal. Importance of the **plant** given by the porportion of visits of each animal. Instead, the values for **animals** tell us the importance of each animal given the proportion of visits that they made.

-   **Species Specificity.** Coefficient of variation of interactions, normalised to values between 0 and 1. Values of 0 indicate low, those of 1 a high variability (and hence suggesting low and high specificity). We can determine if certain **plants** have high visitation and fruit removal by animals or low. Instead, for **animals** we can determine if they have a high efficiency or low. (quantitative index). The difference in this index is that uses the "visitation values "efficiency" of each interaction.

-   **Node specialisation index.** Another measure of specialisation, based on the path length between any two higher-trophic level species. For instance, species sharing hosts/prey have an FS-value of 1. It is a purely qualitative measure. Smaller the values, the more directly type A species are linked with type B species in network, and the less strict is the functional specialization.level of interdependence between plant and frugivore species.

-   **Effective partners.** The effective number of partners, if each partner was equally common. In our study is only useful for plants.

 

    spp_lev_mart<-specieslevel(mart_e)
    spp_lev_mart<-specieslevel(matas_e)

   

#### Martinazo

``` r
HLspplvlmart<-specieslevel(mart_e)
HLspplvlmart$`higher level`[,c(2,3,8,10)]
```

    ##        normalised.degree species.strength species.specificity.index
    ## deer          0.81818182       13.1622086                 0.4271774
    ## wildb         0.40909091        5.4110410                 0.4949941
    ## rabbit        0.13636364        0.3851269                 0.6732193
    ## rat           0.04545455        0.1358108                 1.0000000
    ## badger        0.18181818        2.1950442                 0.6321265
    ## unkn          0.13636364        0.7107685                 0.7131032
    ##        node.specialisation.index.NSI
    ## deer                             1.0
    ## wildb                            1.2
    ## rabbit                           1.4
    ## rat                              1.4
    ## badger                           1.6
    ## unkn                             1.8

``` r
LLspplvlmart<-specieslevel(mart_e)
LLspplvlmart$`lower level`[,c(2,3,7,10,17)]
```

    ##          normalised.degree species.strength species.specificity.index
    ## ER079H           0.1666667      0.292880259                 1.0000000
    ## ER072H           0.3333333      0.140198649                 0.9141947
    ## ER074M-H         0.1666667      0.174872271                 1.0000000
    ## ER028H           0.1666667      0.004567270                 1.0000000
    ## ER073H           0.3333333      0.481954490                 0.9822742
    ## ER052X           0.5000000      0.633710490                 0.7103389
    ## ER047H           0.3333333      0.050306476                 0.6656470
    ## ER053H           0.1666667      0.002399752                 1.0000000
    ## ER061H           0.1666667      0.022653722                 1.0000000
    ## ER002H           0.1666667      0.003473945                 1.0000000
    ## ER067H           0.3333333      0.632499696                 0.7972222
    ## ER036H           0.5000000      0.448603463                 0.9839453
    ## ER037H           0.1666667      0.075930521                 1.0000000
    ## ER044H           0.3333333      0.089068651                 0.6885911
    ## ER007H           0.5000000      0.122768731                 0.5703090
    ## ER080H           0.6666667      2.007257128                 0.4574962
    ## ER050H           0.3333333      0.028379044                 0.6808029
    ## ER071M-H         0.3333333      0.701890831                 0.6600964
    ## ER045H           0.1666667      0.026861743                 1.0000000
    ## ER033H           0.1666667      0.008863601                 1.0000000
    ## ER090H           0.1666667      0.002438458                 1.0000000
    ## ER085H           0.1666667      0.048420808                 1.0000000
    ##          node.specialisation.index.NSI effective.partners
    ## ER079H                        1.857143           1.000000
    ## ER072H                        1.190476           1.301615
    ## ER074M-H                      1.190476           1.000000
    ## ER028H                        1.190476           1.000000
    ## ER073H                        1.190476           1.080368
    ## ER052X                        1.095238           2.068635
    ## ER047H                        1.095238           1.928610
    ## ER053H                        1.190476           1.000000
    ## ER061H                        1.857143           1.000000
    ## ER002H                        1.619048           1.000000
    ## ER067H                        1.095238           1.618363
    ## ER036H                        1.000000           1.083319
    ## ER037H                        1.619048           1.000000
    ## ER044H                        1.095238           1.877627
    ## ER007H                        1.095238           2.594554
    ## ER080H                        1.095238           3.372020
    ## ER050H                        1.095238           1.895081
    ## ER071M-H                      1.190476           1.940745
    ## ER045H                        1.190476           1.000000
    ## ER033H                        1.190476           1.000000
    ## ER090H                        1.190476           1.000000
    ## ER085H                        1.190476           1.000000

 

#### Matasgordas

    ##        normalised.degree species.strength species.specificity.index
    ## deer          0.38235294       4.65431012                 0.4250132
    ## wildb         0.05882353       0.04293365                 0.7038194
    ## rabbit        0.50000000      10.66567635                 0.3969594
    ## rat           0.50000000      10.80032045                 0.2925056
    ## fox           0.02941176       0.01692866                 1.0000000
    ## badger        0.11764706       1.18728386                 0.7437086
    ## unkn          0.26470588       6.63254692                 0.4064613
    ##        node.specialisation.index.NSI
    ## deer                        1.166667
    ## wildb                       1.666667
    ## rabbit                      1.000000
    ## rat                         1.000000
    ## fox                         1.500000
    ## badger                      1.333333
    ## unkn                        1.333333

    ##         normalised.degree species.strength species.specificity.index
    ## EM160           0.2857143      0.039606073                 0.7482541
    ## EM062B          0.2857143      0.031633554                 0.6454972
    ## CHU0108         0.1428571      0.004218138                 1.0000000
    ## EM060           0.2857143      0.044315731                 0.6849574
    ## CHU105M         0.1428571      0.008436276                 1.0000000
    ## EM044           0.2857143      0.077215319                 0.7081241
    ## EM031           0.2857143      0.055583725                 0.7491295
    ## EM190           0.4285714      0.710879163                 0.6358257
    ## EM171           0.1428571      0.053442960                 1.0000000
    ## EM234           0.1428571      0.027116601                 1.0000000
    ## EM090H          0.1428571      0.218822439                 1.0000000
    ## EM007           0.1428571      0.022898463                 1.0000000
    ## EM133           0.2857143      0.338504798                 0.7451653
    ## EM117H          0.2857143      0.100415601                 0.8444323
    ## CHU100          0.1428571      0.067831449                 1.0000000
    ## EM199           0.4285714      0.104029091                 0.6577890
    ## EM003H          0.2857143      0.097979937                 0.8174623
    ## EM136           0.1428571      0.001622624                 1.0000000
    ## EM083H          0.1428571      0.154612888                 1.0000000
    ## EM227           0.2857143      0.031738300                 0.7632775
    ## EM291H          0.4285714      0.923367081                 0.9201322
    ## EM128           0.4285714      0.205024546                 0.5202556
    ## EM240           0.2857143      0.840887770                 0.7004366
    ## EM193           0.1428571      0.054223149                 1.0000000
    ## EM293           0.1428571      0.020862309                 1.0000000
    ## EM123H          0.2857143      0.076199033                 0.8652402
    ## EM298H          0.5714286      1.241468971                 0.5560240
    ## EM297H          0.2857143      0.178462197                 0.7777698
    ## EM300H          0.2857143      0.098607811                 0.9240376
    ## EM028           0.1428571      0.089414183                 1.0000000
    ## CHU114M         0.5714286      0.410788813                 0.8074804
    ## EM013           0.1428571      0.029225670                 1.0000000
    ## CHU096M         0.2857143      0.217935349                 0.9808741
    ## EM001H          0.2857143      0.422629988                 0.7884009
    ##         node.specialisation.index.NSI effective.partners
    ## EM160                        1.242424           1.759089
    ## EM062B                       1.272727           2.000000
    ## CHU0108                      1.515152           1.000000
    ## EM060                        1.242424           1.910656
    ## CHU105M                      1.515152           1.000000
    ## EM044                        1.272727           1.856352
    ## EM031                        1.242424           1.756922
    ## EM190                        1.242424           2.155095
    ## EM171                        1.757576           1.000000
    ## EM234                        1.515152           1.000000
    ## EM090H                       1.515152           1.000000
    ## EM007                        1.515152           1.000000
    ## EM133                        1.272727           1.766719
    ## EM117H                       1.484848           1.508969
    ## CHU100                       1.757576           1.000000
    ## EM199                        1.212121           2.312299
    ## EM003H                       1.242424           1.581668
    ## EM136                        1.515152           1.000000
    ## EM083H                       1.515152           1.000000
    ## EM227                        1.242424           1.721632
    ## EM291H                       1.242424           1.345160
    ## EM128                        1.272727           2.810730
    ## EM240                        1.606061           1.874523
    ## EM193                        1.636364           1.000000
    ## EM293                        1.515152           1.000000
    ## EM123H                       1.272727           1.451330
    ## EM298H                       1.090909           2.753199
    ## EM297H                       1.303030           1.684954
    ## EM300H                       1.242424           1.279148
    ## EM028                        1.757576           1.000000
    ## CHU114M                      1.121212           1.853697
    ## EM013                        1.515152           1.000000
    ## CHU096M                      1.484848           1.087764
    ## EM001H                       1.484848           1.657702

  \#\#\#\#**Step 6.** Gathering Martinazo and Matasgordas' matrixs as one; plants are ordered from more to less aggregated

![](Efficiency_files/figure-markdown_github/Network%20of%20both%20populations-1.png)      

#### **Step 6.1** Calculate indices describing network topography of the general network.

##### **Step 6.1.1** Network measures

-   **Network level** Analysis of bipartite webs at the level of the entire network

-   *Connectance*

-   *Cluster coefficient*

-   *Web Assymethry*

-   *Nestednes and Wegihted Nestedness:*

   

``` r
networklevel(mart_matas_e, index = c("connectance","web asymmetry","cluster coefficient","nestedness","weighted nestedness"))
```

    ##            connectance          web asymmetry    cluster coefficient 
    ##              0.2551020             -0.7777778              0.1964286 
    ##             nestedness    weighted nestedness cluster.coefficient.HL 
    ##             30.5081558              0.3568852              0.4607005 
    ## cluster.coefficient.LL 
    ##              0.3129842

-   *Modularity*

Matasgordas y Martinazo

    ## [1] 0.5487647

##### Ploting modules in the networks

![](Efficiency_files/figure-markdown_github/plots%20of%20the%20modules%20of%20both%20populations%20in%20one-1.png)          

Figure 3.

 

It doesn't make many sense unless the plants have similar characteritics. Perhaps, the plants are the aggregated ones, however, the results can change due to iteration process.

&nbsp \* **Link level.** Interaction variance between nodes. The outcome is a matrix with dependence values. Computes the contribution of each species to the overall nestedness.

``` r
linklevel(mart_matas_e)
```

    ## $`HL dependence`
    ##                  deer       wildb      rabbit         rat fox     badger
    ## EM054    0.0000000000 0.000000000 0.000000000 0.000000000   0 0.00000000
    ## EM160    0.0010088636 0.000000000 0.022808464 0.000000000   0 0.00000000
    ## ER079H   0.0000000000 0.000000000 0.000000000 0.000000000   0 0.14884868
    ## EM236    0.0000000000 0.000000000 0.000000000 0.000000000   0 0.00000000
    ## EM062B   0.0015132954 0.000000000 0.000000000 0.009302326   0 0.00000000
    ## CHU0108  0.0000000000 0.000000000 0.003847211 0.000000000   0 0.00000000
    ## EM060    0.0000000000 0.000000000 0.028579280 0.012403101   0 0.00000000
    ## CHU105M  0.0000000000 0.000000000 0.007694422 0.000000000   0 0.00000000
    ## EM044    0.0000000000 0.000000000 0.000000000 0.012403101   0 0.00000000
    ## EM031    0.0000000000 0.000000000 0.015388843 0.036987818   0 0.00000000
    ## EM066H   0.0000000000 0.000000000 0.000000000 0.000000000   0 0.00000000
    ## ER072H   0.0279959645 0.000000000 0.000000000 0.000000000   0 0.00000000
    ## ER074M-H 0.1627873460 0.000000000 0.000000000 0.000000000   0 0.00000000
    ## EM190    0.0000000000 0.010174419 0.162132454 0.099889258   0 0.00000000
    ## ER028H   0.0042516394 0.000000000 0.000000000 0.000000000   0 0.00000000
    ## EM163    0.0000000000 0.000000000 0.000000000 0.000000000   0 0.00000000
    ## EM008    0.0000000000 0.000000000 0.000000000 0.000000000   0 0.00000000
    ## EM142    0.0000000000 0.000000000 0.000000000 0.000000000   0 0.00000000
    ## EM171    0.0000000000 0.000000000 0.000000000 0.000000000   0 0.00000000
    ## EM234    0.0000000000 0.000000000 0.024732069 0.000000000   0 0.00000000
    ## EM270    0.0000000000 0.000000000 0.000000000 0.000000000   0 0.00000000
    ## EM155    0.0000000000 0.000000000 0.000000000 0.000000000   0 0.00000000
    ## EM090H   0.0000000000 0.000000000 0.000000000 0.209080842   0 0.00000000
    ## ER073H   0.2651149384 0.000000000 0.000000000 0.000000000   0 0.00000000
    ## ER052X   0.0067737984 0.353682171 0.019236054 0.000000000   0 0.00000000
    ## EM007    0.0000000000 0.000000000 0.020884858 0.000000000   0 0.00000000
    ## EM097H   0.0000000000 0.000000000 0.000000000 0.000000000   0 0.00000000
    ## EM133    0.0202853643 0.000000000 0.000000000 0.042967885   0 0.00000000
    ## EM117H   0.0010088636 0.000000000 0.000000000 0.000000000   0 0.00000000
    ## CHU100   0.0000000000 0.000000000 0.000000000 0.000000000   0 0.00000000
    ## ER047H   0.0020177272 0.046996124 0.000000000 0.000000000   0 0.00000000
    ## ER053H   0.0022339122 0.000000000 0.000000000 0.000000000   0 0.00000000
    ## EM199    0.0000000000 0.000000000 0.015388843 0.038538206   0 0.02302632
    ## EM003H   0.0000000000 0.000000000 0.018961253 0.073754153   0 0.00000000
    ## EM136    0.0000000000 0.000000000 0.000000000 0.001550388   0 0.00000000
    ## EM083H   0.0000000000 0.000000000 0.000000000 0.147729790   0 0.00000000
    ## EM227    0.0007566477 0.000000000 0.018961253 0.000000000   0 0.00000000
    ## EM291H   0.0000000000 0.013565891 0.309150866 0.012403101   0 0.00000000
    ## CHU0111  0.0000000000 0.000000000 0.000000000 0.000000000   0 0.00000000
    ## ER061H   0.0000000000 0.000000000 0.000000000 0.000000000   0 0.01151316
    ## ER002H   0.0000000000 0.003391473 0.000000000 0.000000000   0 0.00000000
    ## EM128    0.0017655113 0.000000000 0.000000000 0.027685493   0 0.07401316
    ## ER067H   0.0555595590 0.000000000 0.000000000 0.000000000   0 0.29111842
    ## ER036H   0.2942638899 0.020348837 0.000000000 0.000000000   0 0.05674342
    ## EM138    0.0000000000 0.000000000 0.000000000 0.000000000   0 0.00000000
    ## EM009    0.0000000000 0.000000000 0.000000000 0.000000000   0 0.00000000
    ## ER037H   0.0000000000 0.074127907 0.000000000 0.000000000   0 0.00000000
    ## ER044H   0.0029905599 0.083817829 0.000000000 0.000000000   0 0.00000000
    ## EM240    0.0074944152 0.000000000 0.000000000 0.000000000   0 0.36019737
    ## EM193    0.0037472076 0.000000000 0.000000000 0.000000000   0 0.00000000
    ## EM293    0.0000000000 0.000000000 0.000000000 0.019933555   0 0.00000000
    ## EM123H   0.0012610795 0.000000000 0.000000000 0.055370986   0 0.00000000
    ## ER007H   0.0029905599 0.013565891 0.007694422 0.000000000   0 0.00000000
    ## ER080H   0.0137637818 0.353682171 0.045891728 0.044518272   0 0.00000000
    ## ER050H   0.0010088636 0.026647287 0.000000000 0.000000000   0 0.00000000
    ## ER071M-H 0.0085393096 0.000000000 0.000000000 0.000000000   0 0.00000000
    ## EM298H   0.0029905599 0.000000000 0.114591921 0.069324474   1 0.00000000
    ## EM297H   0.0000000000 0.000000000 0.125858752 0.000000000   0 0.00000000
    ## ER045H   0.0250054046 0.000000000 0.000000000 0.000000000   0 0.00000000
    ## EM300H   0.0000000000 0.000000000 0.007694422 0.086157254   0 0.00000000
    ## ER033H   0.0082510629 0.000000000 0.000000000 0.000000000   0 0.00000000
    ## ER086H   0.0000000000 0.000000000 0.000000000 0.000000000   0 0.00000000
    ## EM028    0.0000000000 0.000000000 0.000000000 0.000000000   0 0.00000000
    ## CHU114M  0.0210059811 0.000000000 0.003847211 0.000000000   0 0.03453947
    ## EM013    0.0000000000 0.000000000 0.026655675 0.000000000   0 0.00000000
    ## ER090H   0.0022699431 0.000000000 0.000000000 0.000000000   0 0.00000000
    ## ER085H   0.0450745838 0.000000000 0.000000000 0.000000000   0 0.00000000
    ## ER070H   0.0000000000 0.000000000 0.000000000 0.000000000   0 0.00000000
    ## CHU096M  0.0002522159 0.000000000 0.000000000 0.000000000   0 0.00000000
    ## EM001H   0.0060171507 0.000000000 0.000000000 0.000000000   0 0.00000000
    ##                unkn
    ## EM054    0.00000000
    ## EM160    0.00000000
    ## ER079H   0.00000000
    ## EM236    0.00000000
    ## EM062B   0.00000000
    ## CHU0108  0.00000000
    ## EM060    0.00000000
    ## CHU105M  0.00000000
    ## EM044    0.05212677
    ## EM031    0.00000000
    ## EM066H   0.00000000
    ## ER072H   0.02585488
    ## ER074M-H 0.00000000
    ## EM190    0.00000000
    ## ER028H   0.00000000
    ## EM163    0.00000000
    ## EM008    0.00000000
    ## EM142    0.00000000
    ## EM171    0.04336947
    ## EM234    0.00000000
    ## EM270    0.00000000
    ## EM155    0.00000000
    ## EM090H   0.00000000
    ## ER073H   0.04628857
    ## ER052X   0.00000000
    ## EM007    0.00000000
    ## EM097H   0.00000000
    ## EM133    0.00000000
    ## EM117H   0.06964137
    ## CHU100   0.05504587
    ## ER047H   0.00000000
    ## ER053H   0.00000000
    ## EM199    0.00000000
    ## EM003H   0.00000000
    ## EM136    0.00000000
    ## EM083H   0.00000000
    ## EM227    0.00000000
    ## EM291H   0.00000000
    ## CHU0111  0.00000000
    ## ER061H   0.00000000
    ## ER002H   0.00000000
    ## EM128    0.00000000
    ## ER067H   0.00000000
    ## ER036H   0.00000000
    ## EM138    0.00000000
    ## EM009    0.00000000
    ## ER037H   0.00000000
    ## ER044H   0.00000000
    ## EM240    0.00000000
    ## EM193    0.00000000
    ## EM293    0.00000000
    ## EM123H   0.00000000
    ## ER007H   0.00000000
    ## ER080H   0.00000000
    ## ER050H   0.00000000
    ## ER071M-H 0.16263553
    ## EM298H   0.00000000
    ## EM297H   0.00000000
    ## ER045H   0.00000000
    ## EM300H   0.00000000
    ## ER033H   0.00000000
    ## ER086H   0.00000000
    ## EM028    0.07256047
    ## CHU114M  0.02627189
    ## EM013    0.00000000
    ## ER090H   0.00000000
    ## ER085H   0.00000000
    ## ER070H   0.00000000
    ## CHU096M  0.17389491
    ## EM001H   0.27231026
    ## 
    ## $`LL dependence`
    ##                deer       wildb     rabbit        rat        fox
    ## EM054           NaN         NaN        NaN        NaN        NaN
    ## EM160    0.25225225 0.000000000 0.74774775 0.00000000 0.00000000
    ## ER079H   0.00000000 0.000000000 0.00000000 0.00000000 0.00000000
    ## EM236           NaN         NaN        NaN        NaN        NaN
    ## EM062B   0.50000000 0.000000000 0.00000000 0.50000000 0.00000000
    ## CHU0108  0.00000000 0.000000000 1.00000000 0.00000000 0.00000000
    ## EM060    0.00000000 0.000000000 0.65000000 0.35000000 0.00000000
    ## CHU105M  0.00000000 0.000000000 1.00000000 0.00000000 0.00000000
    ## EM044    0.00000000 0.000000000 0.00000000 0.30939227 0.00000000
    ## EM031    0.00000000 0.000000000 0.25112108 0.74887892 0.00000000
    ## EM066H          NaN         NaN        NaN        NaN        NaN
    ## ER072H   0.92610250 0.000000000 0.00000000 0.00000000 0.00000000
    ## ER074M-H 1.00000000 0.000000000 0.00000000 0.00000000 0.00000000
    ## EM190    0.00000000 0.019774011 0.55555556 0.42467043 0.00000000
    ## ER028H   1.00000000 0.000000000 0.00000000 0.00000000 0.00000000
    ## EM163           NaN         NaN        NaN        NaN        NaN
    ## EM008           NaN         NaN        NaN        NaN        NaN
    ## EM142           NaN         NaN        NaN        NaN        NaN
    ## EM171    0.00000000 0.000000000 0.00000000 0.00000000 0.00000000
    ## EM234    0.00000000 0.000000000 1.00000000 0.00000000 0.00000000
    ## EM270           NaN         NaN        NaN        NaN        NaN
    ## EM155           NaN         NaN        NaN        NaN        NaN
    ## EM090H   0.00000000 0.000000000 0.00000000 1.00000000 0.00000000
    ## ER073H   0.98513857 0.000000000 0.00000000 0.00000000 0.00000000
    ## ER052X   0.19028340 0.738866397 0.07085020 0.00000000 0.00000000
    ## EM007    0.00000000 0.000000000 1.00000000 0.00000000 0.00000000
    ## EM097H          NaN         NaN        NaN        NaN        NaN
    ## EM133    0.74372523 0.000000000 0.00000000 0.25627477 0.00000000
    ## EM117H   0.14358974 0.000000000 0.00000000 0.00000000 0.00000000
    ## CHU100   0.00000000 0.000000000 0.00000000 0.00000000 0.00000000
    ## ER047H   0.36601307 0.633986928 0.00000000 0.00000000 0.00000000
    ## ER053H   1.00000000 0.000000000 0.00000000 0.00000000 0.00000000
    ## EM199    0.00000000 0.000000000 0.21705426 0.67441860 0.00000000
    ## EM003H   0.00000000 0.000000000 0.17164179 0.82835821 0.00000000
    ## EM136    0.00000000 0.000000000 0.00000000 1.00000000 0.00000000
    ## EM083H   0.00000000 0.000000000 0.00000000 1.00000000 0.00000000
    ## EM227    0.23333333 0.000000000 0.76666667 0.00000000 0.00000000
    ## EM291H   0.00000000 0.023159636 0.93052109 0.04631927 0.00000000
    ## CHU0111         NaN         NaN        NaN        NaN        NaN
    ## ER061H   0.00000000 0.000000000 0.00000000 0.00000000 0.00000000
    ## ER002H   0.00000000 1.000000000 0.00000000 0.00000000 0.00000000
    ## EM128    0.18560606 0.000000000 0.00000000 0.47348485 0.00000000
    ## ER067H   0.81329114 0.000000000 0.00000000 0.00000000 0.00000000
    ## ER036H   0.98659096 0.005073689 0.00000000 0.00000000 0.00000000
    ## EM138           NaN         NaN        NaN        NaN        NaN
    ## EM009           NaN         NaN        NaN        NaN        NaN
    ## ER037H   0.00000000 1.000000000 0.00000000 0.00000000 0.00000000
    ## ER044H   0.32421875 0.675781250 0.00000000 0.00000000 0.00000000
    ## EM240    0.32198142 0.000000000 0.00000000 0.00000000 0.00000000
    ## EM193    1.00000000 0.000000000 0.00000000 0.00000000 0.00000000
    ## EM293    0.00000000 0.000000000 0.00000000 1.00000000 0.00000000
    ## EM123H   0.12280702 0.000000000 0.00000000 0.87719298 0.00000000
    ## ER007H   0.59712230 0.201438849 0.20143885 0.00000000 0.00000000
    ## ER080H   0.25810811 0.493243243 0.11283784 0.13581081 0.00000000
    ## ER050H   0.33734940 0.662650602 0.00000000 0.00000000 0.00000000
    ## ER071M-H 0.37799043 0.000000000 0.00000000 0.00000000 0.00000000
    ## EM298H   0.10036276 0.000000000 0.50423216 0.37847642 0.01692866
    ## EM297H   0.00000000 0.000000000 1.00000000 0.00000000 0.00000000
    ## ER045H   1.00000000 0.000000000 0.00000000 0.00000000 0.00000000
    ## EM300H   0.00000000 0.000000000 0.06714628 0.93285372 0.00000000
    ## ER033H   1.00000000 0.000000000 0.00000000 0.00000000 0.00000000
    ## ER086H          NaN         NaN        NaN        NaN        NaN
    ## EM028    0.00000000 0.000000000 0.00000000 0.00000000 0.00000000
    ## CHU114M  0.83048433 0.000000000 0.01994302 0.00000000 0.00000000
    ## EM013    0.00000000 0.000000000 1.00000000 0.00000000 0.00000000
    ## ER090H   1.00000000 0.000000000 0.00000000 0.00000000 0.00000000
    ## ER085H   1.00000000 0.000000000 0.00000000 0.00000000 0.00000000
    ## ER070H          NaN         NaN        NaN        NaN        NaN
    ## CHU096M  0.01650943 0.000000000 0.00000000 0.00000000 0.00000000
    ## EM001H   0.20365854 0.000000000 0.00000000 0.00000000 0.00000000
    ##               badger       unkn
    ## EM054            NaN        NaN
    ## EM160    0.000000000 0.00000000
    ## ER079H   1.000000000 0.00000000
    ## EM236            NaN        NaN
    ## EM062B   0.000000000 0.00000000
    ## CHU0108  0.000000000 0.00000000
    ## EM060    0.000000000 0.00000000
    ## CHU105M  0.000000000 0.00000000
    ## EM044    0.000000000 0.69060773
    ## EM031    0.000000000 0.00000000
    ## EM066H           NaN        NaN
    ## ER072H   0.000000000 0.07389750
    ## ER074M-H 0.000000000 0.00000000
    ## EM190    0.000000000 0.00000000
    ## ER028H   0.000000000 0.00000000
    ## EM163            NaN        NaN
    ## EM008            NaN        NaN
    ## EM142            NaN        NaN
    ## EM171    0.000000000 1.00000000
    ## EM234    0.000000000 0.00000000
    ## EM270            NaN        NaN
    ## EM155            NaN        NaN
    ## EM090H   0.000000000 0.00000000
    ## ER073H   0.000000000 0.01486143
    ## ER052X   0.000000000 0.00000000
    ## EM007    0.000000000 0.00000000
    ## EM097H           NaN        NaN
    ## EM133    0.000000000 0.00000000
    ## EM117H   0.000000000 0.85641026
    ## CHU100   0.000000000 1.00000000
    ## ER047H   0.000000000 0.00000000
    ## ER053H   0.000000000 0.00000000
    ## EM199    0.108527132 0.00000000
    ## EM003H   0.000000000 0.00000000
    ## EM136    0.000000000 0.00000000
    ## EM083H   0.000000000 0.00000000
    ## EM227    0.000000000 0.00000000
    ## EM291H   0.000000000 0.00000000
    ## CHU0111          NaN        NaN
    ## ER061H   1.000000000 0.00000000
    ## ER002H   0.000000000 0.00000000
    ## EM128    0.340909091 0.00000000
    ## ER067H   0.186708861 0.00000000
    ## ER036H   0.008335347 0.00000000
    ## EM138            NaN        NaN
    ## EM009            NaN        NaN
    ## ER037H   0.000000000 0.00000000
    ## ER044H   0.000000000 0.00000000
    ## EM240    0.678018576 0.00000000
    ## EM193    0.000000000 0.00000000
    ## EM293    0.000000000 0.00000000
    ## EM123H   0.000000000 0.00000000
    ## ER007H   0.000000000 0.00000000
    ## ER080H   0.000000000 0.00000000
    ## ER050H   0.000000000 0.00000000
    ## ER071M-H 0.000000000 0.62200957
    ## EM298H   0.000000000 0.00000000
    ## EM297H   0.000000000 0.00000000
    ## ER045H   0.000000000 0.00000000
    ## EM300H   0.000000000 0.00000000
    ## ER033H   0.000000000 0.00000000
    ## ER086H           NaN        NaN
    ## EM028    0.000000000 1.00000000
    ## CHU114M  0.059829060 0.08974359
    ## EM013    0.000000000 0.00000000
    ## ER090H   0.000000000 0.00000000
    ## ER085H   0.000000000 0.00000000
    ## ER070H           NaN        NaN
    ## CHU096M  0.000000000 0.98349057
    ## EM001H   0.000000000 0.79634146
    ## 
    ## $endpoint
    ##          deer wildb rabbit rat fox badger unkn
    ## EM054       0     0      0   0   0      0    0
    ## EM160      62     0     40   0   0      0    0
    ## ER079H      0     0      0   0   0      8    0
    ## EM236       0     0      0   0   0      0    0
    ## EM062B     62     0      0  36   0      0    0
    ## CHU0108     0     0     20   0   0      0    0
    ## EM060       0     0     40  36   0      0    0
    ## CHU105M     0     0     20   0   0      0    0
    ## EM044       0     0      0  36   0      0   22
    ## EM031       0     0     40  36   0      0    0
    ## EM066H      0     0      0   0   0      0    0
    ## ER072H     62     0      0   0   0      0   22
    ## ER074M-H   31     0      0   0   0      0    0
    ## EM190       0    33     60  54   0      0    0
    ## ER028H     31     0      0   0   0      0    0
    ## EM163       0     0      0   0   0      0    0
    ## EM008       0     0      0   0   0      0    0
    ## EM142       0     0      0   0   0      0    0
    ## EM171       0     0      0   0   0      0   11
    ## EM234       0     0     20   0   0      0    0
    ## EM270       0     0      0   0   0      0    0
    ## EM155       0     0      0   0   0      0    0
    ## EM090H      0     0      0  18   0      0    0
    ## ER073H     62     0      0   0   0      0   22
    ## ER052X     93    33     60   0   0      0    0
    ## EM007       0     0     20   0   0      0    0
    ## EM097H      0     0      0   0   0      0    0
    ## EM133      62     0      0  36   0      0    0
    ## EM117H     62     0      0   0   0      0   22
    ## CHU100      0     0      0   0   0      0   11
    ## ER047H     62    22      0   0   0      0    0
    ## ER053H     31     0      0   0   0      0    0
    ## EM199       0     0     60  54   0     24    0
    ## EM003H      0     0     40  36   0      0    0
    ## EM136       0     0      0  18   0      0    0
    ## EM083H      0     0      0  18   0      0    0
    ## EM227      62     0     40   0   0      0    0
    ## EM291H      0    33     60  54   0      0    0
    ## CHU0111     0     0      0   0   0      0    0
    ## ER061H      0     0      0   0   0      8    0
    ## ER002H      0    11      0   0   0      0    0
    ## EM128      93     0      0  54   0     24    0
    ## ER067H     62     0      0   0   0     16    0
    ## ER036H     93    33      0   0   0     24    0
    ## EM138       0     0      0   0   0      0    0
    ## EM009       0     0      0   0   0      0    0
    ## ER037H      0    11      0   0   0      0    0
    ## ER044H     62    22      0   0   0      0    0
    ## EM240      62     0      0   0   0     16    0
    ## EM193      31     0      0   0   0      0    0
    ## EM293       0     0      0  18   0      0    0
    ## EM123H     62     0      0  36   0      0    0
    ## ER007H     93    33     60   0   0      0    0
    ## ER080H    124    44     80  72   0      0    0
    ## ER050H     62    22      0   0   0      0    0
    ## ER071M-H   62     0      0   0   0      0   22
    ## EM298H    124     0     80  72   4      0    0
    ## EM297H      0     0     20   0   0      0    0
    ## ER045H     31     0      0   0   0      0    0
    ## EM300H      0     0     40  36   0      0    0
    ## ER033H     31     0      0   0   0      0    0
    ## ER086H      0     0      0   0   0      0    0
    ## EM028       0     0      0   0   0      0   11
    ## CHU114M   124     0     80   0   0     32   44
    ## EM013       0     0     20   0   0      0    0
    ## ER090H     31     0      0   0   0      0    0
    ## ER085H     31     0      0   0   0      0    0
    ## ER070H      0     0      0   0   0      0    0
    ## CHU096M    62     0      0   0   0      0   22
    ## EM001H     62     0      0   0   0      0   22

     

##### **Step 6.1.2.**Calculate the topography of the nodes and their relative importance to the network.

-   **Relative degree.**

-   **Species strength.**

-   **Species Specificity.**

-   **Node specialisation index.**

-   **Effective partners.**

 

    spp_lev_mart<-specieslevel(mart_matas_e)

``` r
HLspplvlmart<-specieslevel(mart_matas_e)
HLspplvlmart$`higher level`[,c(2,3,8,10)]
```

    ##        normalised.degree species.strength species.specificity.index
    ## deer          0.55357143      17.81651876                 0.4202456
    ## wildb         0.19642857       5.45397461                 0.5031723
    ## rabbit        0.35714286      11.26675655                 0.3774806
    ## rat           0.32142857      10.93613126                 0.2972673
    ## fox           0.01785714       0.01692866                 1.0000000
    ## badger        0.14285714       3.38232807                 0.4832331
    ## unkn          0.19642857       7.12736210                 0.3696897
    ##        node.specialisation.index.NSI
    ## deer                        1.000000
    ## wildb                       1.333333
    ## rabbit                      1.000000
    ## rat                         1.000000
    ## fox                         1.500000
    ## badger                      1.166667
    ## unkn                        1.333333

``` r
LLspplvlmart<-specieslevel(mart_matas_e)
LLspplvlmart$`lower level`[,c(2,3,7,10,17)]
```

    ##          normalised.degree species.strength species.specificity.index
    ## EM160            0.2857143      0.023817327                 0.7482541
    ## ER079H           0.1428571      0.148848684                 1.0000000
    ## EM062B           0.2857143      0.010815621                 0.6454972
    ## CHU0108          0.1428571      0.003847211                 1.0000000
    ## EM060            0.2857143      0.040982381                 0.6849574
    ## CHU105M          0.1428571      0.007694422                 1.0000000
    ## EM044            0.2857143      0.064529873                 0.7081241
    ## EM031            0.2857143      0.052376661                 0.7491295
    ## ER072H           0.2857143      0.053850844                 0.9166867
    ## ER074M-H         0.1428571      0.162787346                 1.0000000
    ## EM190            0.4285714      0.272196131                 0.6358257
    ## ER028H           0.1428571      0.004251639                 1.0000000
    ## EM171            0.1428571      0.043369475                 1.0000000
    ## EM234            0.1428571      0.024732069                 1.0000000
    ## EM090H           0.1428571      0.209080842                 1.0000000
    ## ER073H           0.2857143      0.311403512                 0.9827709
    ## ER052X           0.4285714      0.379692023                 0.7199604
    ## EM007            0.1428571      0.020884858                 1.0000000
    ## EM133            0.2857143      0.063253249                 0.7451653
    ## EM117H           0.2857143      0.070650231                 0.8444323
    ## CHU100           0.1428571      0.055045872                 1.0000000
    ## ER047H           0.2857143      0.049013851                 0.6771675
    ## ER053H           0.1428571      0.002233912                 1.0000000
    ## EM199            0.4285714      0.076953365                 0.6577890
    ## EM003H           0.2857143      0.092715406                 0.8174623
    ## EM136            0.1428571      0.001550388                 1.0000000
    ## EM083H           0.1428571      0.147729790                 1.0000000
    ## EM227            0.2857143      0.019717901                 0.7632775
    ## EM291H           0.4285714      0.335119858                 0.9201322
    ## ER061H           0.1428571      0.011513158                 1.0000000
    ## ER002H           0.1428571      0.003391473                 1.0000000
    ## EM128            0.4285714      0.103464162                 0.5202556
    ## ER067H           0.2857143      0.346677980                 0.8035462
    ## ER036H           0.4285714      0.371356148                 0.9843948
    ## ER037H           0.1428571      0.074127907                 1.0000000
    ## ER044H           0.2857143      0.086808389                 0.6991169
    ## EM240            0.2857143      0.367691784                 0.7004366
    ## EM193            0.1428571      0.003747208                 1.0000000
    ## EM293            0.1428571      0.019933555                 1.0000000
    ## EM123H           0.2857143      0.056632065                 0.8652402
    ## ER007H           0.4285714      0.024250873                 0.5865111
    ## ER080H           0.5714286      0.457855953                 0.4809018
    ## ER050H           0.2857143      0.027656150                 0.6916614
    ## ER071M-H         0.2857143      0.171174839                 0.6718642
    ## EM298H           0.5714286      1.186906955                 0.5560240
    ## EM297H           0.1428571      0.125858752                 1.0000000
    ## ER045H           0.1428571      0.025005405                 1.0000000
    ## EM300H           0.2857143      0.093851675                 0.9240376
    ## ER033H           0.1428571      0.008251063                 1.0000000
    ## EM028            0.1428571      0.072560467                 1.0000000
    ## CHU114M          0.5714286      0.085664559                 0.8074804
    ## EM013            0.1428571      0.026655675                 1.0000000
    ## ER090H           0.1428571      0.002269943                 1.0000000
    ## ER085H           0.1428571      0.045074584                 1.0000000
    ## CHU096M          0.2857143      0.174147128                 0.9808741
    ## EM001H           0.2857143      0.278327409                 0.7884009
    ##          node.specialisation.index.NSI effective.partners
    ## EM160                         1.218182           1.759089
    ## ER079H                        1.872727           1.000000
    ## EM062B                        1.236364           2.000000
    ## CHU0108                       1.654545           1.000000
    ## EM060                         1.490909           1.910656
    ## CHU105M                       1.654545           1.000000
    ## EM044                         1.509091           1.856352
    ## EM031                         1.490909           1.756922
    ## ER072H                        1.381818           1.301615
    ## ER074M-H                      1.454545           1.000000
    ## EM190                         1.381818           2.155095
    ## ER028H                        1.454545           1.000000
    ## EM171                         1.854545           1.000000
    ## EM234                         1.654545           1.000000
    ## EM090H                        1.690909           1.000000
    ## ER073H                        1.381818           1.080368
    ## ER052X                        1.181818           2.068635
    ## EM007                         1.654545           1.000000
    ## EM133                         1.236364           1.766719
    ## EM117H                        1.381818           1.508969
    ## CHU100                        1.854545           1.000000
    ## ER047H                        1.381818           1.928610
    ## ER053H                        1.454545           1.000000
    ## EM199                         1.400000           2.312299
    ## EM003H                        1.490909           1.581668
    ## EM136                         1.690909           1.000000
    ## EM083H                        1.690909           1.000000
    ## EM227                         1.218182           1.721632
    ## EM291H                        1.381818           1.345160
    ## ER061H                        1.872727           1.000000
    ## ER002H                        1.872727           1.000000
    ## EM128                         1.200000           2.810730
    ## ER067H                        1.400000           1.618363
    ## ER036H                        1.327273           1.083319
    ## ER037H                        1.872727           1.000000
    ## ER044H                        1.381818           1.877627
    ## EM240                         1.400000           1.874523
    ## EM193                         1.454545           1.000000
    ## EM293                         1.690909           1.000000
    ## EM123H                        1.236364           1.451330
    ## ER007H                        1.181818           2.594554
    ## ER080H                        1.090909           3.372020
    ## ER050H                        1.381818           1.895081
    ## ER071M-H                      1.381818           1.940745
    ## EM298H                        1.127273           2.753199
    ## EM297H                        1.654545           1.000000
    ## ER045H                        1.454545           1.000000
    ## EM300H                        1.490909           1.279148
    ## ER033H                        1.454545           1.000000
    ## EM028                         1.854545           1.000000
    ## CHU114M                       1.109091           1.853697
    ## EM013                         1.654545           1.000000
    ## ER090H                        1.454545           1.000000
    ## ER085H                        1.454545           1.000000
    ## CHU096M                       1.381818           1.087764
    ## EM001H                        1.381818           1.657702

     

[1] <span style="color:gray">For more information see previous analysis
