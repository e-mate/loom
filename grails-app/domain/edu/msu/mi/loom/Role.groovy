package edu.msu.mi.loom

class Role implements Serializable {

    private static final long serialVersionUID = 1

    Roles authority

    @Override
    int hashCode() {
        authority?.hashCode() ?: 0
    }

    @Override
    boolean equals(other) {
        is(other) || (other instanceof Roles && other.authority == authority)
    }

    @Override
    String toString() {
        authority
    }

    static constraints = {
        authority blank: false, unique: true
    }

    static mapping = {
        cache true
    }
}
