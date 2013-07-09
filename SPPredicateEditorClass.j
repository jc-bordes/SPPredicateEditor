/*
 * SPPredicateEditorClass.j
 * SPPredicateEditor
 *
 * Created by You on May 23, 2012.
 *
 * Copyright 2012, Your Company. All rights reserved.
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
 */

@import <Foundation/CPObject.j>


/*!
    This class is defined to make it easier to find the bundle,
    for example to get an image from the framework like this:

    @code
    var path = [[CPBundle bundleForClass:SPPredicateEditor] pathForResource:@"email-action.png"];
    @endcode

    You can also use [SPPredicateEditor version] to get the current version.
*/
@implementation SPPredicateEditor : CPObject

+ (CPString)version
{
    var bundle = [CPBundle bundleForClass:[self class]];

    return [bundle objectForInfoDictionaryKey:@"CPBundleVersion"];
}

@end
