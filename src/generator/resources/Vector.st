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

/**
 * Vector2d is the mutable implementation of $names/tupleType()$, for representing points or vectors in $dimensions$ dimensional space of type
 * $componentType$.
 *
 * @author Martin Steiger
 */
public class $names/vectorType()$ extends $names/tupleType()$ {

    $components:{x| private $componentType$ $x$;}; separator = "\n"$

    public $names/vectorType()$() {
    }

    /**
     $components:{x| * @param $x$ the $x$ component}; separator = "\n"$
     */
    public $names/vectorType()$($params/componentParams()$) {
        $components:{x| this.$x$ = $x$;}; separator = "\n"$
    }

    /**
     * Copy constructor
     * @param other The $names/tupleType()$ to copy.
     */
    public $names/vectorType()$($names/tupleType()$ other) {
        this($components:{x| other.get$x.proper$()}; separator = ", "$);
    }

$components:{x|
    @Override
    public $componentType$ get$x.proper$() {
        return $x$;
    \}}; separator = "\n\n"$

$components:{x|
    /**
     * @param new$x.proper$ the new x coordinate
     * @return this $names/vectorType()$, to allow method chaining
     */
    public $names/vectorType()$ set$x.proper$($componentType$ new$x.proper$) {
        this.$x$ = new$x.proper$;
        return this;
    \}}; separator = "\n"$

    /**
     * @param other the point to set
     * @return this
     */
    public $names/vectorType()$ set($names/tupleType()$ other) {
        $components:{x| this.$x$ = other.get$x.proper$();}; separator = "\n"$
        return this;
    }

    /**
     $components:{x| * @param new$x.proper$ the $x$ component}; separator = "\n"$
     * @return this
     */
    public $names/vectorType()$ set($params/componentParamsPrefix("new")$) {
        $components:{x| this.$x$ = new$x.proper$;}; separator = "\n"$
        return this;
    }

$components:{x|
    /**
     * Adds to the $x$ component
     *
     * @param value the value to add to $x$
     * @return this
     */
    public $names/vectorType()$ add$x.proper$($componentType$ value) {
        this.$x$ += value;
        return this;
    \}}; separator = "\n"$

$components:{x|
    /**
     * Subtracts from the $x$ component
     *
     * @param value the value to subtract from $x$
     * @return this
     */
    public $names/vectorType()$ sub$x.proper$($componentType$ value) {
        this.$x$ -= value;
        return this;
    \}}; separator = "\n"$

$components:{x|
    /**
     * Multiplies the $x$ component
     *
     * @param value the value by which to multiply $x$
     * @return this
     */
    public $names/vectorType()$ mul$x.proper$($componentType$ value) {
        this.$x$ *= value;
        return this;
    \}}; separator = "\n"$

$components:{x|
    /**
     * Divides the $x$ component
     *
     * @param value the value by which to divide $x$
     * @return this
     */
    public $names/vectorType()$ div$x.proper$($componentType$ value) {
        this.$x$ /= value;
        return this;
    \}}; separator = "\n"$

    /**
     * Adds a point to this point
     *
     $components:{x| * @param value$x.proper$ the value to add to the $x$ component}; separator = "\n"$
     * @return this
     */
    public $names/vectorType()$ add($params/componentParamsPrefix("value")$) {
        $components:{x| this.$x$ += value$x.proper$;}; separator = "\n"$
        return this;
    }

    /**
     * Adds a point to this point
     *
     * @param other the point
     * @return this
     */
    public $names/vectorType()$ add($names/tupleType()$ other) {
        $components:{x| this.$x$ += other.get$x.proper$();}; separator = "\n"$
        return this;
    }

    /**
     * Subtracts a point from this point
     *
     $components:{x| * @param value$x.proper$ the value to subtract from the $x$ component}; separator = "\n"$
     * @return this
     */
    public $names/vectorType()$ sub($params/componentParamsPrefix("value")$) {
        $components:{x| this.$x$ -= value$x.proper$;}; separator = "\n"$
        return this;
    }

    /**
     * Subtracts a point from this point
     *
     * @param other the point
     * @return this
     */
    public $names/vectorType()$ sub($names/tupleType()$ other) {
        $components:{x| this.$x$ -= other.get$x.proper$();}; separator = "\n"$
        return this;
    }

    /**
     * Multiplies this with a scalar value
     *
     * @param value a scalar value
     * @return this
     */
    public $names/vectorType()$ scale($componentType$ value) {
        $components:{x| this.$x$ *= value;}; separator = "\n"$
        return this;
    }

    /**
     * Sets the point coords. to (-x, -y)
     *
     * @return this
     */
    public $names/vectorType()$ invert() {
        $components:{x| this.$x$ *= -1;}; separator = "\n"$
        return this;
    }

$if(!componentType.discrete)$
    /**
     * Set the length of this vector to one
     *
     * @return this
     */
    public $names/vectorType()$ normalize() {
        return scale(1 / length());
    }
$endif$

}
