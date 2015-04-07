

class MapNode
{
  ArrayList<MapNode> m_neighbors = new ArrayList<MapNode>();
  ArrayList<Integer> m_neighborDist = new ArrayList<Integer>();
  PVector m_position;
  boolean m_isWalkable;
  //F = G + H
  //G = movement cost from start to here
  //H = heuristic movement from here to end
  float F = -1, G = -1, H = -1;
  MapNode m_pathedFrom;
  
  ////////////////////////////////////////////////////////////////////////////////////////
  MapNode()
  {
    init(new PVector(0,0), null);
  }
  MapNode(PVector position)
  {
    init(position, null);
  }
  MapNode(PVector position, ArrayList<MapNode> neighbors)
  {
    init(position, neighbors);
  }
  MapNode(int posX, int posY, ArrayList<MapNode> neighbors)
  {
    init(new PVector(posX, posY), neighbors);
  }
  
  public boolean init(PVector position, ArrayList<MapNode> neighbors)
  {
    m_neighbors = neighbors;
    m_position = position.get();
    m_isWalkable = true;
    return true;
  }
  
  ////////////////////////////////////////////////////////////////////////////////////////
  float heuristics(MapNode destination)
  {
    return PVector.dist(m_position, destination.m_position);
  }
  
  ////////////////////////////////////////////////////////////////////////////////////////
  boolean updateCost(int costOfLastNode, int costToComeHere, MapNode comeFrom, MapNode goTo)
  {
    float tempH = heuristics(goTo);
    float tempG = costOfLastNode + costToComeHere;
    float tempF = tempG + tempH;
      
    if( F < 0 || tempF < F)
    {
      H = tempH;
      G = tempG;
      F = tempF;
      m_pathedFrom = comeFrom;
      return true;
    }
    else
    {
      return false;
    }
  }
  
  ////////////////////////////////////////////////////////////////////////////////////////
  resetNode()
  {
    F = G = H = -1;
    m_pathedFrom = null;
  }
}
