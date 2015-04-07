//finish FIND PATH
//finish CREATE GRID MAP

class Map
{
  ArrayList<MapNode> allNodes = new ArrayList<MapNode>();
  ArrayList<MapNode> closedList  = new ArrayList<MapNode>();
  ArrayList<MapNode> openList  = new ArrayList<MapNode>();
  ArrayList<MapNode> unusedList  = new ArrayList<MapNode>();
  
  ////////////////////////////////////////////////////////////////////////////////////////
  Map()
  {
  }
  
  ////////////////////////////////////////////////////////////////////////////////////////
  public void addNode(MapNode m)
  {
    allNodes.add(m);
  }
  
  ////////////////////////////////////////////////////////////////////////////////////////
  public void createGridMap(int horizCount, int vertCount, int spacing)
  {
    //create each node
    
    for(int i = 0; i < horizCount; i++)
    {
      for(int j = 0; j < vertCount; j++)
      {
        //MapNode m = new MapNode(
      }
    }
    
    //add surrounding nodes as neighbors
  }
  
  ////////////////////////////////////////////////////////////////////////////////////////
  public void addNeighborsToOpenList(MapNode node, MapNode destination)
  {
    for(int i = 0; i < node.m_neighbors.size(); i++)
    {
      //first check if node is on closedList
      if(! closedList.contains(node.m_neighbors[i])) //node not on closed list
      {
        //check if you found a shortest distance to that node
        if(updateCost(node.G, node.m_neighborDist[i], node, destination)) //true if shortest dist to node
        {
          if(! openList.contains(node.m_neighbors[i])) //node not on open list
          {
            openList.add(node.m_neighbors[i]);
          }
        }
      }
    }
  }
  
  ////////////////////////////////////////////////////////////////////////////////////////
  public ArrayList<MapNode> findPath(PVector position, PVector destination)
  {
    MapNode start = findClosestWalkableNode(position);
    MapNode end = findClosestWalkableNode(destination);
    return findPath(start, end);
  }
  public ArrayList<MapNode> findPath(MapNode position, MapNode destination)
  {
    //clear out any nodes in open, closed, and unused
    for(MapNode n : openList)
    {
      removeFromList(n, openList);
    }
    for(MapNode n : closedList)
    {
      removeFromList(n, closedList);
    }
    for(MapNode n : unusedList)
    {
      removeFromList(n, unusedList);
    }
    //add all nodes to unused
    for(MapNode n : allNodes)
    {
      if(n.isWalkable)
      {
        unusedList.add(n);
      }
    }
    
    /*********************/
    //current node = start
    MapNode current = position;
    
    do
    {
      //add neighbors of current to open
      //move current to closed
      //find smallest F in open
      //update current to smallest F node
      //break if current is destination
    }while(!openList.isEmpty());
    
    //check if current is destination
    //build path and return it
  }
  
  ////////////////////////////////////////////////////////////////////////////////////////
  public MapNode findClosestWalkableNode(PVector target)
  {
    float bestDist = -1;
    MapNode bestNode;
    for(int i = 0; i < allNodes.size(); i++)
    {
      if(allNodes[i].isWalkable)
      {
        float tempDist = PVector.dist(allNodes[i].m_position, target);
        if(bestNode == null || tempDist < bestDist)
        {
          bestNode = allNodes[i];
          bestDist = tempDist;
        }
      }
    }
    return bestNode;
  }
  
  ////////////////////////////////////////////////////////////////////////////////////////
  removeFromList(MapNode node, ArrayList<MapNode> list)
  {
    node.resetNode();
    list.remove(node);
  }
}
