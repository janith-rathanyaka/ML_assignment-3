R = [
  -inf,-inf,-inf,-inf,0,-inf;
  -inf,-inf,-inf,0,-inf,100;
  -inf,-inf,-inf,0,-inf,-inf;
  -inf,0,0,-inf,0,-inf;
  0,-inf,-inf,0,-inf,100;
  -inf,0,-inf,-inf,0,100;
];

gamma = 0.7;
goalState = 6;
q = zeros(size(R));

for episode=1:1000
  y = randperm(size(R,1));
  state = y(1);
  
  while state ~= goalState
    actions = find(R(state,:)>=0);
    if size(actions, 2) >0
      i = randperm(size(actions,2));
      action = actions(i(1));
    end  
   qMax = max(q,[],2);
   
   q(state,action) = R(state,action) + gamma * qMax(action);
   state = action;
  end  
end


p = max(max(q))
q = q/p*100;

statement = 3;

printf("Traversal Order for Agent \n");
display(statement-1); 
while statement~=goalState
  [mx,action] =max(q(statement,:));  
  statement =action ;
  display(statement-1)
 
end
