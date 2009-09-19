// Just to check that everyrhing can be compliled

template <class T>
class list {
};

template <class T>
list<T> CONS(T t1, T t2) { return list<T>(); }

template <class T>
list<T> CONS(T t1, const list<T>& l) { return list<T>(); }

///////////////////////////////
// covariant macros

#define INTERACTS_WITH(role) typedef typename ConfigType::role role

#define INTERACTS_WITH_SELF typedef typename ConfigType::Self Self

#define USES_INHERITED(base) typedef base<ConfigType> inherited

#define ACTOR \
    template <typename ConfigType> \
        class

#define SPECIALIZED_ACTOR(name, base) \
    template <typename ConfigType> \
        class name: public base<ConfigType>

#define CONFIGURATION(name) struct name { \
    typedef name self;

#define END_CONFIGURATION };

#define ASSIGN_ROLE(role, actor) \
    typedef actor<self> role;

/////////////////
// DirGraph

ACTOR Edge { public:
    INTERACTS_WITH(V);
    Edge(V& v1, V& v2);       // a covariant constructor
    void set_first(V& v);     // a covariant method
    void set_second(V& v);    // another covariant method
    V& get_first();           // a method with a covariant return value
    //{} more definitions \ldots
    protected: V *first, *second; // two covariant fields
};
ACTOR Vertex { public:
    INTERACTS_WITH(E);
    Vertex(const list<E *>& l = list<E*>());   // a constructor
    void insert_edge(E &e);                    // a covariant method
    //{} \ldots
    protected: list<E *> edges; // a covariant field
};
ACTOR Graph { public:
    INTERACTS_WITH(V);
    INTERACTS_WITH(E);
    Graph(list<V *>& vs, list<E *>& es);   // a doubly covariant constructor
    //{} \ldots
    protected: list<V *> vertices; list<E *> edges;
};

CONFIGURATION(GraphConfig)
    ASSIGN_ROLE(V, Vertex)
    ASSIGN_ROLE(E, Edge)
    ASSIGN_ROLE(G, Graph)
END_CONFIGURATION

GraphConfig::V v1, v2, v3;
GraphConfig::E e12(v1,v2), e23(v2, v3);
GraphConfig::G g(CONS(&v1,CONS(&v2, &v3)), CONS(&e12, &e23));

/////////////////
// DirGraph

SPECIALIZED_ACTOR(DEdge, Edge) { public:
    //{} role \cd{V} is inherited
    V* source() const; V* target() const;
    // more functionality
    protected: //  new internal staff
};
SPECIALIZED_ACTOR(DVertex, Vertex) { public:
    //{} role \cd{E} is inherited
    //{} extend functionality \ldots
    protected: // new internal staff
};
SPECIALIZED_ACTOR(DGraph, Graph) { public:
    //{} roles \cd{V} and \cd{E} are inherited
    //{} new functionality and algorithms
    protected: // new internal staff
};

CONFIGURATION(DGraphConfig)
    ASSIGN_ROLE(V, DVertex)
    ASSIGN_ROLE(E, DEdge)
    ASSIGN_ROLE(G, DGraph)
END_CONFIGURATION

DGraphConfig::V aDirVertex;


///////////////////////////////
// Face

SPECIALIZED_ACTOR(FEdge, DEdge) { public:
    //{} role \cd{V} is inherited
    INTERACTS_WITH(F);
    F* getFace() const { return face; }
    // more functionality
    protected:  F* face;
};
ACTOR Face { public:
    INTERACTS_WITH(E);
    //{} \ldots
    protected: list<E*> edges;
};
SPECIALIZED_ACTOR(FGraph, DGraph) { public:
    INTERACTS_WITH(F);     //{} roles \cd{V} and \cd{E} are inherited
    //{} \ldots
    protected: list<F*> faces;
};

CONFIGURATION(FGraphConfig)
    ASSIGN_ROLE(V, DVertex)
    ASSIGN_ROLE(E, FEdge)
    ASSIGN_ROLE(F, Face)
    ASSIGN_ROLE(G, FGraph)
END_CONFIGURATION

FGraphConfig::F face;
FGraphConfig::V fVertex;

///////////////////////////////
// Point - ColorPoint

ACTOR Point { public:
    INTERACTS_WITH_SELF;
    bool equal(const Self& other) const { return x == other.x && y == other.y;}
	void move(int dx, int dy) { x += dx; y += dy; }   // a covariant method
protected: int x, y;
};

CONFIGURATION(PConfig)
    ASSIGN_ROLE(Self, Point)
END_CONFIGURATION

SPECIALIZED_ACTOR(ColorPoint, Point) { public:
    USES_INHERITED(Point);
    //{} Self is inherited
    bool equal(const Self& other) const {
        return inherited::equal(other) && color == other.color;}
protected: int color;
};

CONFIGURATION(CPConfig)
    ASSIGN_ROLE(Self, ColorPoint);
END_CONFIGURATION


#define COVARIANT_METHOD template <typename ConfigType>
#define ACTOR_TYPE(actor) actor<ConfigType>

COVARIANT_METHOD
void print(const ACTOR_TYPE(Point)& point) { /* ... */ }

void main()
{

PConfig::Self p1, p2;;
CPConfig::Self cp1, cp2;

p1.equal(p2);             // Ok
cp1.equal(cp2);           // Ok
cp2.move(2, 3);           // call to the covariant method
//CPConfig::Self& rcp = p1; // a compiler error

print(p1);
print(cp1);

}