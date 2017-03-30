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

![nn_graph_sizehidden_compare](https://cloud.githubusercontent.com/assets/25333848/24498641/59ad71cc-153f-11e7-8e6f-b66d11a3400d.gif)

What I observed was that going over 8 layer didn't improve much our algorithm. And as expected, taking more complex algorithm, is detrimental to reach a high enough accuracy.

To look at this effect, I search for the moment where the accuracy increase begins to stabilize, which I estimated at about 70 iterations, and it is strangely consistent throughout all the models.

![nn_accuracy_proof](https://cloud.githubusercontent.com/assets/25333848/24516018/98216514-1579-11e7-9b9d-98279932d4e1.png)
![nn_accuracy_bargraph](https://cloud.githubusercontent.com/assets/25333848/24516102/da932ec8-1579-11e7-932c-1759efff2150.jpg)
