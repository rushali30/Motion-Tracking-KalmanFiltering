# Motion-Tracking-KalmanFiltering
Motion-tracking--Kalman
Kalman filtering based motion tracking program (MATLAB) OBJECTIVE In this project, we label observations (3D points) using greedy and Hungarian algorithm and use the observed data to update our prediction model, providing correctly labeled observations with predictions filled in where observations are missing.

THEORY Kalman Filter: Kalman filter is used to predict the next state from the past state and is then updated with the true observation of that state. In the project, the states have position and velocity vectors. All the states are normally distributed with mean and covariance’s. Hence, we update and predict the mean and covariance of the states. While predicting mean and covariance, we consider a zero mean Gaussian noise. Also, while updating the mean from the observations we should take into account observation noise. With the correct usage of state vectors, we can appropriately predict and update states.

Greedy Algorithm: This method considers the fact that no two states can be associated with a single observation. Hence, we have single observation for each state. Greedy algorithm is an easy to implement strategy. We assign observations to state depending upon minimum Euclidean distance or maximum correlation between states. In our project, we find the minimum Euclidean distance between points and labels (state means). Depending upon this distance, we say that a point is associated to a label if it is near to the label (i.e. minimum distance is the best fit solution). However, optimal solution is not guaranteed from this approach.

Hungarian Algorithm: This method is a popular technique for providing optimal solution. This method requires a square matrix(balanced) for association. In case of rectangular matrices(unbalanced), we make it square by adding rows to the matrix and then perform Hungarian method. This method provides optimal solution by finding minimum lines that can cover the zeros created in a reduced square matrix. Without proper balancing, we might find trouble in producing good data association. One problem which we faced was failure to find minimum lines to cover the zeros. This approach is difficult to implement as compared to the greedy association but it gives a better data association than greedy.

METHODS We have implemented two methods for data association, greedy algorithm and Hungarian method. The main code of our project is main_greedy.m and main_hungarian.m for each of the two-data association method used. Hungarian method is difficult to implement whereas Greedy method is

easier to implement. This Matlab code uses all the sub-functions provided in project1.zip. In addition to that we are using Hungarian.m, greedy.m, score.m and kf_mandy.m functions to get the desired output. We have submitted our main codes and sub-function codes required for project tracking. Please download them in the project1 folder and run the ‘main’ codes.

Total frames for the given set is 1-8000. Our code uses the initial frame as 827, which is initframe. And number of times the iteration to be performed in denoted by fps, which is 100 in our case. As you increase the value of fps, number of iteration increases and thus, the output is observed for longer duration and full movement of the object is noticed. Using fps, we define the start and the end frame for the program. In our case the segment of the noisy data used is 828 to 928 frame.

Initial statemeans and statecovmats are the matrices which has initial mean and covariance of the state vector which is stored in these variables for filtering and association. We have used Greedy.m for implementing greedy association and similarly we can use Hungarian.m function for data association as in the case of main_hungarian.m. Updated statemeans and statecovmats by applying Kalman filter: kf_mandy is part of our code, which uses Bayes theorem to predict and update the pdf and thus mean and covariance.

Note: Run main_greedy.m or main_hungarian.m and they will call sub-functions to perform tasks when needed. main_greedy uses greedy algorithm to perform data association while main_hungarian uses Hungarian algorithm.

Greedy: Also, called as Best First Strategy is used for performing hard data association necessarily giving optimal solution. This function uses the current statemean and current state covariance matrix along with observed points to obtain association of these observed points to state mean.

greedy(observed,statemeans,statecovmats) Input arguments: Observed points, Initial statemeans and Initial statecovmats

//[observ_labeled,scores]

Output of this function are: Associated observed points and score of the frame processed. Steps for this algorithm:

We generate a matrix of minimum distances of points from the statemeans.
Rows corresponds to observed points and columns corresponds to statemeans.
We find the minimum value of distance in each row.
This minimum distance represents points to the particular statemeans.
For few missing observation, we assign the output statemeans as the one used for labeling.
For quantitative analysis, we calculate the score which is given by the minimum distance associated with the associated output points. Hungarian: This is another method we used for data association. This method is also called as Kuhn-Munkres algorithm. This function uses similar argument as Greedy method but it is based on combinational optimization of points, means and covariance. This method gives the optimal solution as compared to greedy association.
//hungarian( obsv,stmns,cov ) Input arguments: obsv is the observed points, stmns is the initial statemeans and cov is the initial state covariance matrix.

//[obsv_labeled,scores]

Output of this function are: obsv_labeled is the associated labeled observed points and scores of Hungarian method. Kf_mandy.m This function is used for providing the next statemeans and statecovmats for the given state vector. This part is performing Kalman filtering using the current statemeans, statecovmats and associated observed points which are obtained from previous methods, to give the statemeans and statecovmats for next state. Kalman filtering is divided in two parts: -1) Predicting and 2) Updating

Predicting In this part, we predict the next statemeans and statecovmats using state matrices F and H.
Updating This predicted statemeans and statecovmats is updated using Kalman gain and Associated observed points (found from greedy.m or Hungarian.m).
Score.m This function is used to generate scores using Euclidean distance between statemeans and observations (3D points). It transforms the distance table into a score table for data association while Euclidean distance table is generated in Greedy or Hungarian functions. Using this function, an observation (point) that has the same distance from 2 different labels/statemeans may get different scores based on the probability distributions of the two states (both Gaussian but with different covariances)
