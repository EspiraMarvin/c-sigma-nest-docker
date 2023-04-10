import {
  Body,
  Controller,
  Delete,
  Get,
  HttpCode,
  HttpStatus,
  NotFoundException,
  Param,
  ParseIntPipe,
  Patch,
  Post,
} from '@nestjs/common';
import { BookmarkService } from './bookmark.service';
import { CreateBookmarkDto, EditBookmarkDto } from './dto';

@Controller('bookmarks')
export class BookmarkController {
  constructor(private bookmarkService: BookmarkService) {}
  @Get()
  getBookmarks() {
    return this.bookmarkService.getBookmarks();
  }

  @Get(':id')
  getSingleBookmark(@Param('id', ParseIntPipe) bookmarkId: number) {
    try {
      return this.bookmarkService.getSingleBookmark(bookmarkId);
    } catch (error) {
      throw new NotFoundException();
    }
  }

  @Post()
  createBookmarksById(@Body() dto: CreateBookmarkDto) {
    return this.bookmarkService.createBookmark(dto);
  }

  @Patch(':id')
  editBookmark(
    @Param('id', ParseIntPipe) bookmarkId: number,
    @Body() dto: EditBookmarkDto,
  ) {
    try {
      return this.bookmarkService.editBookmark(bookmarkId, dto);
    } catch (error) {
      throw new NotFoundException();
    }
  }

  @HttpCode(HttpStatus.NO_CONTENT) // NOT_CONTENT 204 error
  @Delete(':id')
  deleteBookmarksById(@Param('id', ParseIntPipe) bookmarkId: number) {
    try {
      return this.bookmarkService.deleteBookmark(bookmarkId);
    } catch (error) {
      throw new NotFoundException();
    }
  }
}
