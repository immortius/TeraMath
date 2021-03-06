/*
 * Copyright 2014 MovingBlocks
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *  http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package org.terasology.math.geom;


import com.google.common.base.Preconditions;

/**
 * A vector/point in $dimensions$D space
 * @author Martin Steiger
 */
public abstract class $names/tupleType()$ {

    public static final $names/immutableVectorType()$ ZERO = new $names/immutableVectorType()$($params/valueList(components, "0")$);
    public static final $names/immutableVectorType()$ ONE = new $names/immutableVectorType()$($params/valueList(components, "1")$);

$components:{x|
    /**
      * @return $x$ the $x$ coordinate
      */
    public abstract $componentType$ get$x.proper$(); };separator="\n"$

$if(!componentType.discrete)$
    /**
     * @param a the first point
     * @param b the second point
     * @param t the interpolation value in the range [0..1]
     * @return the interpolated point
     */
    public static $names/vectorType()$ lerp($names/tupleType()$ a, $names/tupleType()$ b, $componentType$ t) {
        Preconditions.checkArgument(t >= 0 && t <= 1, "t must be in range [0..1]");

        $components:{x| $componentType$ $x$ = a.get$x.proper$() * (1 - t) + b.get$x.proper$() * t; }; separator = "\n"$
        return new $names/vectorType()$($components;separator=", "$);
    }
$endif$

    /**
     * @return the distance to the origin
     */
    public $componentType$ lengthSquared() {
        return $components:{x| get$x.proper$() * get$x.proper$()};separator = " + "$;
    }
    
    /**
     * @return the distance to the origin
     */
    public $componentType$ length() {
        return $if(!componentType.doubleType)$(float) $endif$Math.sqrt(lengthSquared());
    }

    /**
     * @param other the other point
     * @return the distance in between
     */
    public $componentType$ distanceSquared($names/tupleType()$ other) {
        $components:{x|$componentType$ d$x$ = other.get$x.proper$() - this.get$x.proper$();}; separator = "\n"$

        return $components:{x| d$x$ * d$x$}; separator = " + "$;
    }

    /**
     * @param other the other point
     * @return the distance in between
     */
    public $componentType$ distance($names/tupleType()$ other) {
        return $if(!componentType.doubleType)$(float) $endif$Math.sqrt(distanceSquared(other));
    }

    /**
     * Computes the distance between two points
     * @param p1 the first point
     * @param p2 the second point
     * @return the distance between the two points
     */
    public static $componentType$ distance($names/tupleType()$ p1, $names/tupleType()$ p2) {
        return p1.distance(p2);
    }

    /**
     * All point implementations with the same coordinate are equal
     */
    @Override
    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj instanceof $names/tupleType()$) {
            $names/tupleType()$ other = ($names/tupleType()$) obj;
$if(componentType.toIntegralFunc)$
            return $components:{x | $componentType.toIntegralFunc$(get$x.proper$()) == $componentType.toIntegralFunc$(other.get$x.proper$())}; separator = " && "$;
$else$
            return $components:{x | get$x.proper$() == other.get$x.proper$()};separator = " && "$;
$endif$
        }
        return false;
    }

    /**
     * All point implementations with the same coordinate have the same hashcode
     */
    @Override
    public final int hashCode() {
        final int prime = 31;
        int result = 1;
$if(componentType.toIntegralFunc)$
        long temp;
$components:{x |
        temp = $componentType.toIntegralFunc$(get$x.proper$());
        result = prime * result + (int) (temp ^ (temp >>> 32));}$
$else$
        $components:{x |result = prime * result + (int) (get$x.proper$() ^ (get$x.proper$() >>> 32));}; separator = "\n"$
$endif$
        return result;
    }
    
    @Override
    public String toString() {
        return "(" + $components:{x | get$x.proper$()}; separator = " + \", \" + "$ + ")";
    }
}
