# Neural-Net-visualisation-with-MATLAB
A deepening of the exercice n°4 from the Andrew Ng course, to study the effect of the size of a neural net, see how it converge, through iterations.


# A visualisation of the training of a neural net

<p align="center">

![nn_training](https://cloud.githubusercontent.com/assets/25333848/24498619/4ce25d68-153f-11e7-8cf7-23c460702fab.gif)

*From a random distribution to start, to converge toward a local minimum.*

</p>

![nn_trained](https://cloud.githubusercontent.com/assets/25333848/24498620/4cef4474-153f-11e7-9e4e-3dfd6c654f5e.gif)

*Different local minimum after 10000 iterations*

## Was the choice of 25 hidden layers pertinent ?

To actualy compare it I choose to start with a unique hidden layer, and record it's accuracy over time. And did the same up to 10 layer, then to 55 by increment of 5.

![nn_graph_sizehidden_compare](https://cloud.githubusercontent.com/assets/25333848/24522101/c4f56242-158e-11e7-95a5-7bcf2cc93f01.gif)

What I observed was that going over 8 layer didn't improve much our algorithm. Except if an overfit and a 100 % accuracy was wanted. And as first expected, taking more complex algorithm, is detrimental to reach a high enough accuracy.

To look at this effect, I searched for the moment where the accuracy increase begins to stabilize, which I estimated at about 70 iterations, and it is strangely consistent throughout all the models. Also looking at what accuracy were the neural nets after X amounts of iterations

![nn_accuracy_proof](https://cloud.githubusercontent.com/assets/25333848/24516018/98216514-1579-11e7-9b9d-98279932d4e1.png)

![nn_accuracy_bargraph_30i](https://cloud.githubusercontent.com/assets/25333848/24522141/e5628e92-158e-11e7-882d-407b054bc4fd.jpg)

![nn_accuracy_bargraph_50i](https://cloud.githubusercontent.com/assets/25333848/24522142/e5752160-158e-11e7-9b77-2a2e7974f89a.jpg)

![nn_accuracy_bargraph_70i](https://cloud.githubusercontent.com/assets/25333848/24522140/e55a12f8-158e-11e7-8369-8d2c43ef2c39.jpg)

A counter intuitive discovery was a better accuracy reached more quickly with more hidden layer.
